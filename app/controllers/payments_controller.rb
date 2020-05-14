class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    @product = Product.find(params[:productId])
  end

  def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    product_id = payment.metadata.product_id
    user_id = payment.metadata.user_id
    product= Product.find(product_id)
    
  
    head 200
  end

  def get_stripe_id
    @product = Product.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @product.title,
        description: @product.description,
        amount: @product.price * 100,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          product_id: @product.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&productId=#{@product.id}",
      cancel_url: "#{root_url}products"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end

end