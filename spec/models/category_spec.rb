# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rails_helper'

describe Category, type: :model do
  subject { create(:category) }

  context 'validation' do
    %i[title].each do |field|
      it { is_expected.to allow_value('email@mail.cx').for(field) }
      it { is_expected.to_not allow_value('').for(field) }
      it { is_expected.to_not allow_value('3').for(field) }
    end

    %i[posts_count].each do |field|
      it { is_expected.to allow_value(1).for(field) }
      it { is_expected.to allow_value(0).for(field) }
      it { is_expected.to_not allow_value(-1).for(field) }
    end
  end

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

  context 'to_s' do
    it { expect(subject.to_s).to eq(subject.title) }
    it { expect(subject.to_s.class).to be String }
  end

  context 'links' do
    %i[creator].each do |association|
      it { is_expected.to have_one(association) }
    end

    %i[posts subscribers].each do |association|
      it { is_expected.to have_many(association) }
    end
  end
end
