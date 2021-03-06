# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Comment, type: :model do
  let(:user) { create(:user) }
  subject { create(:creator, user_id: user.id) }

  %i[id created_at updated_at category_id user_id].each do |field|
    it { is_expected.to have_db_column(field) }
  end

  context 'valid' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'not valid without a user' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'not valid without a category' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end

  context 'links' do
    %i[category user].each do |association|
      it { is_expected.to belong_to(association) }
    end

    it 'link with user' do
      user = User.find(subject.user_id)
      creator = user.creators.create(category_id: subject.category_id, user_id: subject.user_id)
      expect(creator).to be_valid
    end

    it 'to_s should return user name' do
      expect(subject.to_s).to eq(user.name)
    end
  end
end
