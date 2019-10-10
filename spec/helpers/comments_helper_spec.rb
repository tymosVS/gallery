require "rails_helper"

describe CommentsHelper, type: :helper do
  let(:comment) { create(:comment) }
  describe "comment author" do
    it "returns the author name" do
      expect(author(comment.user_id)).to eq(comment.user.name)
    end
  end
end