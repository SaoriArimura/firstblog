require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a email" do
    expect(build(:user, email: '')).to be_invalid
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a password" do
    expect(build(:user, password: nil)).to have(1).errors_on(:password)
  end

  it "is invalid with a duplidcate name" do
    create(:user,
            name: "uuuu")
    expect(build(:user,
                 name: "uuuu")).to have(1).errors_on(:name)
  end

end
