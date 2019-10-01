# frozen_string_literal: true
require "simplecov"
SimpleCov.start

require 'rails_helper'

describe Image, :type => :model do
  let(:image) { create(:image) } 
  subject { image }

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
end
