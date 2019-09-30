# frozen_string_literal: true

require 'rails_helper'

describe User, :type => :model do
  let(:admin_user) { create(:admin_user) }
  subject { admin_user }

  context 'valid' do
    it 'valid with valid attributes' do
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
end
