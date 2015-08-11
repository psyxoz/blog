class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :delete_all

  validates :title, presence: true

  default_scope { order('created_at DESC') }

  after_create do
    Resque.enqueue(SubscriptionJob, self.id)
  end
end
