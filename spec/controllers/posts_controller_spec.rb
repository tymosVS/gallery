require 'rails_helper'

describe PostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories/1').to route_to('posts#index', category_id: '1',)
    end

    it 'routes to #create' do
      expect(post: '/categories/1').to route_to('posts#create', category_id: '1',)
    end

    it 'routes to #new' do
      expect(get: '/categories/1/new').to route_to('posts#new', category_id: '1',)
    end

    it 'routes to #show' do
      expect(get: '/categories/1/1').to route_to('posts#show', category_id: '1', id: '1')
    end

    # it 'routes to #update via PATCH' do
    #   expect(patch: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    # end

    # it 'routes to #update via PUT' do
    #   expect(put: '/categories/1/1').to route_to('posts#update', category_id: '1', id: '1')
    # end

    it 'routes to #delete' do
      expect(delete: '/categories/1/1').to route_to('posts#destroy', category_id: '1', id: '1')
    end
  end
end

describe PostsController,  type: :controller do
  context 'posts #index' do 
    let(:category) {create(:category)}
    it 'should success and render to index page' do
        get :index, params: { category_id: category.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
    end
  end

  context 'posts #show' do
    let(:category) {create(:category)}
    let(:post) {create(:post, category_id: category.id)}

    it 'should success and render to show page' do
        get :show, params: { category_id: category.id, id: post.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
        # assert_response(200)
        # assert_render :show
    end
  end
end
