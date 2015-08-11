class PostMailer < ApplicationMailer
  def send_email(params = {})
    @post = params[:post]
    @subscription = params[:subscription]
    mail(to: @subscription.email, subject: "New post")
  end
end
