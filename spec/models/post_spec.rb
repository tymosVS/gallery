require 'rails_helper'

describe Post, :type => :model do
  let(:post) { create(:post) } 
  subject { post }

  context "valid" do
    it 'valid with valid attributes' do 
      expect(subject).to be_valid
    end
  end

  context "not valid" do
    it 'not valid without image' do 
      subject.image_id = nil
      expect(subject).to_not be_valid
    end

    it 'not valid without category' do 
      subject.category_id = nil
      expect(subject).to_not be_valid
    end
  end

  context "links" do
    it "post string equal image title" do
      img = Image.find(subject.image_id)
      expect(subject.to_s).to eql(img.title)
    end

    it "check link to with categories" do
      category = Category.find(subject.category_id)
      expect(category.posts.create(image_id: subject.image_id, 
                                  category_id: subject.category_id)).to be_valid
    end
  end

  context "delete" do
    it "delete posts" do
      id = subject.id
      subject.destroy
      expect(Post.where(id: id).count).to eq(0)
    end

    it "delete image when delete post" do
      id = subject.image_id
      subject.destroy
      expect(Image.where(id: id).count).to eq(0)
    end

    it "delete likes when delete post" do
      id = subject.image_id
      10.times do
        create(:fan, image_id: id)
      end
      subject.destroy
      expect(Fan.where(image_id: id).count).to eq(0)
    end

    it "delete likes when delete post" do
      id = subject.image_id
      10.times do
        create(:comment, image_id: id)
      end
      subject.destroy
      expect(Comment.where(image_id: id).count).to eq(0)
    end
  end
end