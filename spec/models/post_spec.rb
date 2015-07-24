require 'spec_helper'

describe Post do
  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  it "is valid with a review,user_id,item_id and category_tag_id" do
    post = Post.new(
      review: 'aa',
      user_id: '1',
      item_id: '2',
      category_tag_id: '2')
      expect(post).to be_valid
  end

  it "is invalid without a review" do
    expect(Post.new(review: nil)).to have(1).errors_on(:review)
  end

  it "is invalid without a category_tag_id" do
    expect(Post.new(category_tag_id: nil )).to have(1).errors_on(:category_tag_id)
  end
 
  it "is invalid without a review" do
    expect(build(:post, review: nil)).to have(1).errors_on(:review)
  end

  it "is invalid without a category_tag_id" do
    expect(build(:post, category_tag_id: nil)).to have(1).errors_on(:category_tag_id)
  end

  it "is invalid without a item_id" do
    expect(build(:post, item_id: nil)).to have(1).errors_on(:item_id)
  end



end
