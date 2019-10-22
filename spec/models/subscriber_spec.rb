# frozen_string_literal: true

require 'rails_helper'

describe Subscriber, type: :model do
  let(:subscriber) { create(:subscriber) }
  subject { subscriber }

  %i[id created_at updated_at user_id category_id].each do |field|
    it { is_expected.to have_db_column(field) }
  end

  context 'valid' do
    it 'valid with valid attributes' do
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

    %i[user category].each do |association|
      it { is_expected.to belong_to(association) }
    end

    it 'check link to with categories' do
      category = Category.find(subject.category_id)
      expect(category.subscribers.create(user_id: create(:user).id, category_id: subject.category_id)).to be_valid
    end

    it 'subscrib string equal user name' do
      usr = User.find(subject.user_id)
      expect(subject.to_s).to eql(usr.name)
    end
  end

  context 'dublikate' do
    it 'not possible create 2 identic record' do
      Subscriber.create(category_id: subject.category_id, user_id: subject.user_id)
      Subscriber.create(category_id: subject.category_id, user_id: subject.user_id)
      expect(Subscriber.count).to eql(1)
    end
  end
end
