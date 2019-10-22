# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  subject { user }

  %i[
    id created_at updated_at email encrypted_password reset_password_token reset_password_sent_at
    remember_created_at sign_in_count current_sign_in_at last_sign_in_at current_sign_in_ip
    last_sign_in_ip name confirmation_token confirmed_at confirmation_sent_at unconfirmed_email
    failed_attempts unlock_token locked_at cached_failed_attempts avatar
  ].each do |field|
    it { is_expected.to have_db_column(field) }
  end

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
      10.times { User.create(email: 'qwe@mail.com', name: 'Vas', password: '123321') }
      expect(User.count).to eq(1)
    end
  end

  context 'links' do
    context 'has many' do
      %i[comments subscribers creators fans user_actions].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end
end
