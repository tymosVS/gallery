# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe ImageParser, type: :model do
  let(:image_parser) { create(:image_parser) }
  subject { image_parser }

  %i[id created_at updated_at site_path image_url].each do |field|
    it { is_expected.to have_db_column(field) }
  end

  context 'validation' do
    %i[image_url].each do |field|
      it { is_expected.to allow_value('dsf').for(field) }
      it { is_expected.to_not allow_value('').for(field) }
    end
  end
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
