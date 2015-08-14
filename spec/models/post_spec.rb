require 'rails_helper'

describe Post, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should have_many :comments }

  let(:post) { create(:post, title: 'post number 10') }

  it 'seo friendly' do
    expect(post.slug).to eql('post-number-10')
  end

  describe 'after create' do
    it 'enqueue emails delivery' do
      expect(Resque).to receive(:enqueue).with(SubscriptionJob, anything).once
      create(:post)
    end
  end
end
