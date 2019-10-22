# frozen_string_literal: true

require 'rails_helper'

describe Comment, type: :model do
  subject { create(:comment) }

  %i[id created_at updated_at body image_id user_id].each do |field|
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

    it 'not valid without a image' do
      subject.image_id = nil
      expect(subject).to_not be_valid
    end

    it 'not valid without a text comment' do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end

  context 'links' do
    it 'link with user' do
      user = User.find(subject.user_id)
      comment = user.comments.create(
        image_id: subject.image_id,
        user_id: subject.user_id,
        body: Faker::Lorem.sentence(word_count: 15)
      )
      expect(comment).to be_valid
    end

    it 'link with category' do
      image = Image.find(subject.image_id)
      img = image.comments.create(
        image_id: subject.image_id,
        user_id: subject.user_id,
        body: Faker::Lorem.sentence(word_count: 15)
      )
      expect(img).to be_valid
    end
  end
end
