require 'rails_helper'

describe SubscriptionsController, type: :controller do
  render_views

  describe '#create' do
    let(:email) { 'test@test.com' }
    let(:json) { JSON.parse(response.body) }

    before do
      post :create, subscription: { email: email }
    end

    it 'responds code is 201' do
      expect(response).to have_http_status(:created)
    end

    it 'render json' do
      expect(json.keys).to include('success')
      expect(json['success']).to eq(true)
    end

    context 'invalid email' do
      let(:email) { '@some.email.bad' }

      it 'render errors' do
        expect(json.keys).to include('errors')
        expect(json['errors']).to eq(['Email is not an email'])
      end
    end
  end

  describe '#destroy' do
    let(:subscription) { create :subscription }

    before do
      get :destroy, token: subscription.token
    end

    it { expect(Subscription.count).to eql(0) }

    it 'notifies' do
      expect(flash[:notice]).to eql('Your subscription was removed')
    end

    it 'redirects to root' do
      expect(response).to redirect_to(root_path)
    end
  end
end
