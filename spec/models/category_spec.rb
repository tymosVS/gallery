# frozen_string_literal: true

require 'rails_helper'

describe Category, type: :model do
  subject { create(:category) }

  context 'valid' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    %i[id created_at updated_at title description slug posts_count].each do |field|
      it { is_expected.to have_db_column(field) }
    end

    it 'is valid without a description' do
      subject.description = nil
      expect(subject).to be_valid
    end
  end

  context 'not valid' do
    it 'is not valid without a title && description' do
      subject.title = nil
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'delete' do
    it 'delete categories' do
      id = subject.id
      subject.destroy
      expect(Category.where(id: id).count).to eq(0)
    end

    it 'delete posts in delete category' do
      create(:post, category_id: subject.id)
      id = subject.id
      subject.destroy
      expect(Post.where(category_id: id).count).to eq(0)
    end

    it 'delete subscribers in delete category' do
      create(:subscriber, category_id: subject.id)
      id = subject.id
      subject.destroy
      expect(Subscriber.where(category_id: id).count).to eq(0)
    end
  end

  context 'links' do
    it 'have many posts' do
      5.times do
        create(:post, category_id: subject.id)
      end
      expect(Post.where(category_id: subject.id).count).to eq(5)
    end

    it 'have many subscribers' do
      5.times do
        create(:subscriber, category_id: subject.id)
      end
      expect(Subscriber.where(category_id: subject.id).count).to eq(5)
    end
  end
end
