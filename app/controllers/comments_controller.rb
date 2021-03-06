class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params.merge({user_id: current_user.id}))
    redirect_to product_path(@product)
  end

  

  def destroy
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product)
  end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
