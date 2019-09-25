require 'rails_helper'

describe Subscriber, :type => :model do
  let(:user_action) { create(:user_action) } 
  subject { user_action }

  context "valid" do
    it 'valid with valid attributes' do 
      expect(subject).to be_valid
    end
  end

  context "not valid" do
    it "not valid without a user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "not valid without a action" do
      subject.action = nil
      expect(subject).to_not be_valid
    end
  end
end