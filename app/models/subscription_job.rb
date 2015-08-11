class SubscriptionJob
  @queue = :default

  def self.perform(post_id)
    post = Post.find(post_id)

    Subscription.find_each do |s|
      PostMailer.send_email(post: post, subscription: s).deliver_now
    end
  end
end