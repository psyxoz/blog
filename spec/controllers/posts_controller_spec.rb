require 'rails_helper'

describe PostsController, type: :controller do
  render_views

  let!(:posts) { create_list(:post, 20) }

  shared_examples "code 200" do
    it { expect(response).to have_http_status(:ok) }
  end

  describe '#index' do
    let(:params) {}
    before { get :index, params }

    include_examples "code 200"

    it 'renders template' do
      expect(response).to render_template(:index)
    end

    describe 'paginate' do
      let(:params) { { page: 2 } }
      it 'filter results' do
        # Kaminari.default_per_page is 5
        expect(assigns(:posts).length).to eq(5)
      end
    end
  end

  describe '#show' do
    let(:post) { posts.first }
    before { get :show, id: post.slug }

    include_examples "code 200"

    it 'renders template' do
      expect(response).to render_template(:show)
    end

    it 'assigns @post' do
      expect(assigns(:post).id).to eq(post.id)
    end
  end
end
