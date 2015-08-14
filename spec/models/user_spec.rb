require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of :email }
  it { should have_many :comments }
end
