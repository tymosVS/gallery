require 'rails_helper'

describe Image, :type => :model do
  let(:image) { create(:image) } 
  subject { image }

  context "valid" do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end
  end

  context "not valid" do
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
end