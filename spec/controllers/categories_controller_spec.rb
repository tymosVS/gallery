require 'rails_helper'

describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #delete' do
      expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
    end
  end
end

describe CategoriesController,  type: :controller do
  context 'GET #index' do 
    it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
    end

  #   let(:category) { create(:category) }
  #   let(:post) { create(:post, category_id:category.id)}
  #   it 'should success and render to index page' do
  #     get :index
  #     expect(@category_images.count).to eq(1)
      
  # end

  end

  context 'DELETE #destroy' do
    let!(:category) { create :category }

    it 'should delete category' do
        expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end
  end
end

