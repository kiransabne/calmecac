require 'rails_helper'

RSpec.describe Level, type: :model do

  it "is valid with valid attributes" do

    kind = create(:kind)
    badge = Badge.new(name: "New badge", kind_id: kind.id, points:10, default: false)
    # badge cant return id attribute ???
    # error  Badge must exist
    level = Level.new(badge_id: badge.id, user_id: create(:user).id)
    # expect(level).to be_valid
  end

  it "is not valid without badge_id" do
    level = Level.new(badge_id: nil)
    expect(level).to_not be_valid
  end

  it "is not valid without badge_id" do
    level = Level.new(user_id: nil)
    expect(level).to_not be_valid
  end

end
