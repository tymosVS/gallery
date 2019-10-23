# frozen_string_literal: true

require 'rails_helper'

describe CategoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/categories').to route_to('categories#index')
    end

    it 'routes to #delete' do
      expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
    end

    it { should route(:get, '/categories').to(action: :index) }
    it { should route(:delete, '/categories/1').to(action: :destroy, id: 1) }
  end
end

describe CategoriesController, type: :controller do
  context 'GET #index' do
    let(:category) { create(:category) }

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'assigns the category' do
      get :index
      expect(assigns(:categories)).to include(category)
    end
  end

  context 'DELETE #destroy' do
    let!(:category) { create :category }

    it 'should delete category' do
      expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
    end

    it 'should raise ArgumentError' do
      expect do
        delete :destroy, id: 100
      end.to raise_error(ArgumentError)
    end
  end
end
