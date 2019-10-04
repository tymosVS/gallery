# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe User, type: :model do
  let(:user) { create(:user) }
  subject { user }

  context 'valid' do
    it 'valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'valid without a name' do
      subject.name = nil
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'not valid when passwords do not match' do
      subject.password = 'password1'
      expect(subject).to_not be_valid
    end

    it 'not valid when password empty' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  context 'not valid' do
    it 'not possible create few user with equals params' do
      10.times do
        User.create(email: 'qwe@mail.com', name: 'Vas', password: '123321')
      end
      expect(User.count).to eq(1)
    end
  end

  context 'links' do
    it 'user have many comments' do
      5.times do
        create(:comment, user_id: user.id)
      end
      expect(Comment.where(user_id: user.id).count).to eq(5)
    end

    it 'user have many user_actions' do
      5.times do
        create(:user_action, user_id: user.id)
      end
      expect(UserAction.where(user_id: user.id).count).to eq(5)
    end

    it 'user have many likes' do
      5.times do
        create(:fan, user_id: user.id)
      end
      expect(Fan.where(user_id: user.id).count).to eq(5)
    end

    it 'user have many creators' do
      5.times do
        create(:creator, user_id: user.id)
      end
      expect(Creator.where(user_id: user.id).count).to eq(5)
    end

    it 'user have many subscribes' do
      5.times do
        create(:subscriber, user_id: user.id)
      end
      expect(Subscriber.where(user_id: user.id).count).to eq(5)
    end
  end
end
