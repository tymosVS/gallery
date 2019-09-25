require 'rails_helper'

describe Category, :type => :model do
  let(:category) { create(:category) } 
  subject { category }

  context "valid" do
    it 'is valid with valid attributes' do 
      expect(subject).to be_valid
    end

    it "is valid without a description" do
      subject.description = nil
      expect(category).to be_valid
    end
  end

  context "not valid" do
    it "is not valid without a title && description" do
      subject.title = nil
      subject.description = nil
      expect(category).to_not be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(category).to_not be_valid
    end
  end
end