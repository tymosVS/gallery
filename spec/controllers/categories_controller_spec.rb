# frozen_string_literal: true

require 'rails_helper'

describe CategoriesController, type: :routing do
  describe 'routing' do
    context 'have' do
      it 'routes to #index' do
        expect(get: '/categories').to route_to('categories#index')
      end

      it 'routes to #delete' do
        expect(delete: '/categories/1').to route_to('categories#destroy', id: '1')
      end

      it { should route(:get, '/categories').to(action: :index) }
      it { should route(:delete, '/categories/1').to(action: :destroy, id: 1) }
    end

    context 'not have' do
      it { should_not route(:get, '/categories/new').to(action: :new) }
      it { should_not route(:post, '/categories').to(action: :create) }
      it { should_not route(:get, '/categories/1').to(action: :show, id: 1) }
      it { should_not route(:patch, '/categories/1').to(action: :update, id: 1) }
      it { should_not route(:put, '/categories/1').to(action: :update, id: 1) }
      it { should_not route(:get, '/categories/1/edit').to(action: :edit, id: 1) }
    end
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

  context 'actions' do
    %i[set_category].each do |action|
      it { should use_before_action(action) }
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
