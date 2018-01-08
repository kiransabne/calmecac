class Course < ApplicationRecord
  belongs_to :user

  resourcify

  def owner?(user)
    self.user.id == user.id
  end
end
