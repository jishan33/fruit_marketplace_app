class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  # this action will be performed when the payment has succeeded, the items has been purchased, their quantity will be substracted by the purchased amount. Also the users cart will be cleared out.
  def success
    cart = Cart.find(params[:cartId])
    products = cart.products
    products.each do |product|
      product.quantity -= 1
      product.save
    end

    cart.destroy
  end

  # used for local host testing
  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    product_id = payment.metadata.product_id
    user_id = payment.metadata.user_id
    product = Product.find(product_id)

    head 200
  end

  # stipe connected code. Get the products in the users cart and translate them into stripe line items.
  # Pass success_url to stripe to let us know when the transaction is successful (see success method on this controller)
  def get_stripe_id
    cart = current_user.cart
    products = cart.products
    line_items = products.map do |product|
      {
        name: product.title,
        description: product.description,
        amount: product.price * 100,
        currency: 'aud',
        quantity: 1,
      }
    end

    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,

      line_items: line_items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          cart_id: cart.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&cartId=#{cart.id}",
      cancel_url: "#{root_url}products"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end
end
