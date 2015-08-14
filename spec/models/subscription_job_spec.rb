require 'rails_helper'

describe SubscriptionJob, type: :model do
  describe '#perform' do
    let!(:post) { create(:post) }
    let!(:subscriptions) { create_list(:subscription, 10) }

    it 'send emails' do
      expect(Subscription).to receive(:find_each).and_call_original
      expect(PostMailer).to receive(:send_email)
        .with(hash_including(:subscription, :post => post))
        .and_return(double(deliver_now: true))
        .exactly(10).times
      described_class.perform(post.id)
    end
  end
end
