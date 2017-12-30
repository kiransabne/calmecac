require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = User.new(email:"testo@test.com", password:"123porCalmecac")
    expect(user).to be_valid
  end

  it "is not valid without email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

end
