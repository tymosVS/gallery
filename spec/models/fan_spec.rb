# frozen_string_literal: true

require 'rails_helper'

describe Fan, type: :model do
  subject { create(:fan) }

  %i[id created_at updated_at image_id user_id].each do |field|
    it { is_expected.to have_db_column(field) }
  end

  context 'valid' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'not valid without a image' do
      subject.image_id = nil
      expect(subject).to_not be_valid
    end

    it 'not valid without a user' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end

  context 'links' do
    %i[image user].each do |association|
      it { is_expected.to belong_to(association) }
    end

    it 'fan string equal user name' do
      usr = User.find(subject.user_id)
      expect(subject.to_s).to eql(usr.name)
    end

    it 'fan string equal image title' do
      img = Image.find(subject.image_id)
      fan = img.fans.create(image_id: subject.image_id, user_id: subject.user_id)
      expect(fan).to be_valid
    end
  end
end
