require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is valid with a name, email, email_confirmation, password and password_confirmation" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
  end
  
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("Please fill out.")
  end

  it "is invalid without a email" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to be_invalid
  end
  
  it "is invalid without email_confirmation" do
    user = FactoryBot.build(:user, email_confirmation: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a password_confirmation" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    expect(user).to be_invalid
  end
  
end
