require 'rails_helper'

RSpec.describe Badge, type: :model do

  it "is valid with valid attributes" do
    kind = create(:kind)
    badge = Badge.new(name: "New badge", kind_id: kind.id, points:10, default: false)
    expect(badge).to be_valid
  end

  it "is not valid without name" do
    badge = Badge.new(name: nil)
    expect(badge).to_not be_valid
  end

  it "is not valid without kind" do
    badge = Badge.new(kind_id: nil)
    expect(badge).to_not be_valid
  end

  it "is not valid without points" do
    badge = Badge.new(points: nil)
    expect(badge).to_not be_valid
  end

  it "is not valid without default" do
    badge = Badge.new(default: nil)
    expect(badge).to_not be_valid
  end

end
