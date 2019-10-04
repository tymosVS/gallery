# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Fan, type: :model do
  let(:image_parser) { create(:image_parser) }
  subject { image_parser }

  context 'valid' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'not valid without a image_url' do
      subject.image_url = nil
      expect(subject).to_not be_valid
    end
  end
end
