# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Subscriber, type: :model do
  let(:user_action) { create(:user_action) }
  subject { user_action }

  context 'valid' do
    it 'valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'not valid without a action' do
      subject.action = nil
      expect(subject).to_not be_valid
    end
  end

  context 'delete' do
    it 'clear actions removed users' do
      id = subject.user_id
      User.find(id).destroy
      expect(UserAction.where(user_id: id).count).to eq(0)
    end
  end
end
