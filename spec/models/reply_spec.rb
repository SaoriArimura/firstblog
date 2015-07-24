require 'spec_helper'

describe Reply do
  it "has a valid factory" do
    expect(build(:reply)).to be_valid
  end
 
  it "is invalid without a user_id" do
    expect(build(:reply, user_id: nil)).to have(1).errors_on(:user_id)
  end

   it "is invalid without a post_id" do
    expect(build(:reply, post_id: nil)).to have(1).errors_on(:post_id)
  end

  it "is invalid without a context" do
    expect(build(:reply, context: nil)).to have(1).errors_on(:context)
  end


end
