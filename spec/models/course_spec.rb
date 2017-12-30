require 'rails_helper'

RSpec.describe Course, type: :model do

  it "is valid with valid attributes" do
    course = Course.new(name: "My course", description: "course description", objectives: "course, objectives", user:create(:user))
    expect(course).to be_valid
  end

  it "is not valid without name" do
    course = Course.new(name: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without description" do
    course = Course.new(description: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without objectives" do
    course = Course.new(objectives: nil)
    expect(course).to_not be_valid
  end

  it "is not valid without user" do
    course = Course.new(user: nil)
    expect(course).to_not be_valid
  end

end
