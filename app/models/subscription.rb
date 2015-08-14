class Subscription < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, email: true

  before_create do
    self.token = SecureRandom.uuid
  end
end
