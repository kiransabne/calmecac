require 'rails_helper'

RSpec.describe Point, type: :model do

  it "is valid with valid attributes" do
    point = Point.new(user_id:create(:user).id, kind_id:create(:kind).id, value:1)
    expect(point).to be_valid
  end

  it "is not valid without user_id" do
    point = Point.new(user_id: nil)
    expect(point).to_not be_valid
  end

  it "is not valid without kind_id" do
    point = Point.new(kind_id: nil)
    expect(point).to_not be_valid
  end

  it "is not valid without value" do
    point = Point.new(value: nil)
    expect(point).to_not be_valid
  end

end
