class SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: { success: true }, status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    subscription = Subscription.find_by_token(params[:token])
    subscription.destroy
    redirect_to root_path, flash: { notice: 'Your subscription was removed' }
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end