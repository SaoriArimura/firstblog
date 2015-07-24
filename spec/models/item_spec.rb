require 'spec_helper'

describe Item do
  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  it "is invalid without a book_id" do
    expect(build(:item, book_id: nil)).to have(1).errors_on(:book_id)
  end


end
