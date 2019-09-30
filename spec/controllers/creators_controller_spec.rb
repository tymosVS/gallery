require 'rails_helper'

describe CreatorsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/creators/new').to route_to('creators#new')
    end

    it 'routes to #create' do
      expect(post: '/creators').to route_to('creators#create')
    end
  end
end

describe CreatorsController,  type: :controller do
  context 'comment #create' do 
    let(:user) { create(:user) } 
    let(:category) { build(:category) } 

    it 'should create new category' do
      sign_in user
      expect { post :create, params:  
                            { category: 
                              { title: category.title, 
                                description: category.description } } }.to change(Category, :count).by(1)
    end
  end
end
