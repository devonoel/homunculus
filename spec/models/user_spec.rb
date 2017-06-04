require 'rails_helper'

describe User, type: :model do
  it "requires a unique name" do
    create(:user, name: "test")
    expect(build(:user, name: "test")).to_not be_valid
  end

  it "does not allow a password of 3 or fewer characters" do
    expect(build(:user, password: "123", password_confirmation: "123")).to_not be_valid
  end

  it "allows a password of length 4 or more" do
    expect(build(:user, password: "1234", password_confirmation: "1234")).to be_valid
  end

  context "on creation" do
    it "is invalid without a confirmation" do
      expect(build(:user, password: "1234", password_confirmation: nil)).to_not be_valid
    end

    it "is invalid with a mismatched confirmation" do
      expect(build(:user, password: "1234", password_confirmation: "12345")).to_not be_valid
    end

    it "is valid with a matching confirmation" do
      expect(build(:user, password: "1234", password_confirmation: "1234")).to be_valid
    end
  end
end
