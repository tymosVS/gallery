# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Subscriber, type: :model do
  let(:subscriber) { create(:subscriber) }
  subject { subscriber }

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
    it 'check link to with categories' do
      category = Category.find(subject.category_id)
      expect(category.subscribers.create(user_id: create(:user).id, category_id: subject.category_id)).to be_valid
    end

    it 'subscrib string equal user name' do
      usr = User.find(subject.user_id)
      expect(subject.to_s).to eql(usr.name)
    end
  end
end
