class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :content, :post, :user, presence: true

  default_scope { order('created_at DESC') }
end
