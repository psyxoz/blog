class SubscriptionsController < ApplicationController
  expose(:subscription, attributes: :subscription_params,
         finder: :find_by_token, finder_parameter: :token)

  def create
    if subscription.save
      render json: { success: true }, status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    subscription.destroy
    redirect_to root_path, flash: { notice: 'Your subscription was removed' }
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end