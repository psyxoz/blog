class Subscription < ActiveRecord::Base
  validates :email, :token, presence: true, uniqueness: true

  before_validation do
    if token.blank?
      self.token = SecureRandom.uuid
    end
  end
end
