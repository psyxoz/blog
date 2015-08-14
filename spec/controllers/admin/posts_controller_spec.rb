require 'rails_helper'

describe Admin::PostsController, type: :controller do
  render_views
  let!(:posts) { create_list(:post, 20) }

  before do
    sign_in create(:admin_user)
  end

  describe '#index' do
    before { get :index }

    it 'render posts list' do
      expect(assigns(:posts).length).to eq(5)
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    before { get :new }

    it 'render post new' do
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    let(:post) { posts.first }
    before { get :edit, id: post.slug }

    it 'render post edit' do
      expect(assigns(:post).id).to eq(post.id)
      expect(response).to render_template(:edit)
    end
  end

  let(:params) { { title: 'test', content: 'something' } }

  shared_examples "manage_success" do
    before { make_request }

    it 'notifies' do
      expect(flash[:notice]).to eql(notice_message)
    end

    it 'redirects to root' do
      expect(response).to redirect_to(admin_path)
    end
  end

  shared_examples "manage_failed" do
    let!(:params) { { title: '' } }

    it 'render new post page' do
      expect(make_request).to render_template(expected_template)
      expect(assigns(:post).valid?).to_not be_truthy
    end
  end

  describe '#create' do
    let(:make_request) { post :create, :post => params }
    it { expect { make_request }.to change { Post.count }.by(1) }

    it_behaves_like "manage_success" do
      let(:notice_message) { 'Post created' }
    end

    it_behaves_like "manage_failed" do
      let(:expected_template) { :new }
    end
  end

  describe '#update' do
    let(:make_request) { put :update, id: posts.first.slug, :post => params }

    it_behaves_like "manage_success" do
      let(:notice_message) { 'Post updated' }
    end

    it_behaves_like "manage_failed" do
      let(:expected_template) { :edit }
    end
  end
end
