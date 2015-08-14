require 'rails_helper'

describe CommentsController, type: :controller do
  render_views

  describe '#create' do
    let!(:blog_post) { create :post }
    let(:content) { 'super comment' }
    let(:json) { JSON.parse(response.body) }

    before do
      sign_in create(:user)
      post :create, post_id: blog_post.slug, comment: { content: content }
    end

    it 'responds code is 201' do
      expect(response).to have_http_status(:created)
    end

    it 'render json' do
      expect(json.keys).to include('content')
      expect(json['content']).to eq(content)
    end

    context 'invalid content' do
      let(:content) { '' }

      it 'render errors' do
        expect(json.keys).to include('errors')
        expect(json['errors']).to eq(["Content can't be blank"])
      end
    end
  end
end
