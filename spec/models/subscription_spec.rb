require 'rails_helper'

describe Subscription, type: :model do
  it { should validate_presence_of :email }

  it 'allow only valid emails' do
    bad_subscription = described_class.new(email: 'test.test.co')
    expect(bad_subscription.valid?).to eq(false)
    expect(bad_subscription.errors.full_messages).to include('Email is not an email')

    good_subscription = described_class.new(email: 'test@test.com')
    expect(good_subscription.valid?).to eq(true)
  end
end
