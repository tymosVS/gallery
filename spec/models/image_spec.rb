# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Image, type: :model do
  let(:image) { create(:image) }
  subject { image }

  %i[id created_at updated_at title image comments_count fans_count].each do |field|
    it { is_expected.to have_db_column(field) }
  end

  context 'validation' do
    %i[title image].each do |field|
      it { is_expected.to_not allow_value('').for(field) }
      it { is_expected.to_not allow_value('e').for(field) }
    end

    %i[fans_count comments_count].each do |field|
      it { is_expected.to allow_value(1).for(field) }
      it { is_expected.to allow_value(0).for(field) }
      it { is_expected.to_not allow_value(-1).for(field) }
    end
  end

  context 'valid' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a image' do
      subject.image = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a image & title' do
      subject.image = nil
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'delete' do
    it 'delete categories' do
      id = subject.id
      subject.destroy
      expect(Post.where(id: id).count).to eq(0)
    end

    it 'delete comments in delete category' do
      10.times do
        create(:comment, image_id: subject.id)
      end
      id = subject.id
      subject.destroy
      expect(Comment.where(image_id: id).count).to eq(0)
    end

    it 'delete likes in delete category' do
      10.times do
        create(:fan, image_id: subject.id)
      end
      id = subject.id
      subject.destroy
      expect(Fan.where(image_id: id).count).to eq(0)
    end

    it 'delete likes in delete category when such other dependens' do
      10.times do
        create(:fan, image_id: subject.id)
        create(:comment, image_id: subject.id)
      end
      id = subject.id
      subject.destroy
      like_count = Fan.where(image_id: id).count
      comment_count = Comment.where(image_id: id).count
      expect(like_count + comment_count).to eq(0)
    end
  end

  context 'links' do
    context 'has_one' do
      %i[post].each do |association|
        it { is_expected.to have_one(association) }
      end
    end

    context 'has_many' do
      %i[comments fans].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end
end
