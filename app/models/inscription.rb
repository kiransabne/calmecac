class Inscription < ApplicationRecord
  belongs_to :course
  belongs_to :user

  enum status: %i[inactive active completed]
end
