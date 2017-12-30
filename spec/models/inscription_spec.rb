require 'rails_helper'

RSpec.describe Inscription, type: :model do

  it "is valid with valid attributes" do
    inscription = Inscription.new(assigned: false, status: "in_progress", course:create(:course), user:create(:user))
    expect(inscription).to be_valid
  end

  it "is not valid without assigned" do
    inscription = Inscription.new(assigned: nil)
    expect(inscription).to_not be_valid
  end

  it "is not valid without status" do
    inscription = Inscription.new(status: nil)
    expect(inscription).to_not be_valid
  end

  it "is not valid without course" do
    inscription = Inscription.new(course: nil)
    expect(inscription).to_not be_valid
  end

  it "is not valid without user" do
    inscription = Inscription.new(user: nil)
    expect(inscription).to_not be_valid
  end

end
