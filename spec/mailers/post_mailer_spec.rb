require "rails_helper"

describe PostMailer, type: :mailer do
  describe 'send_email' do
    let(:post) { create(:post) }
    let(:subscription) { create(:subscription) }
    let(:mail) { described_class.send_email(post: post, subscription: subscription) }

    it 'has correct subject' do
      expect(mail.subject).to eq('New post')
    end

    it 'email body contains post title' do
      expect(mail.body).to include(post.title)
    end

    it 'has unsubscribe link' do
      expect(mail.body).to include("token=#{subscription.token}\">Unsubscribe</a>")
    end
  end
end
