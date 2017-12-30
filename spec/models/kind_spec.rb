require 'rails_helper'

RSpec.describe Kind, type: :model do

  it "is valid with valid attributes" do
    kind = Kind.new(name: "new kind" )
    expect(kind).to be_valid
  end

  it "is not valid without name" do
    kind = Kind.new(name: nil)
    expect(kind).to_not be_valid
  end

end
