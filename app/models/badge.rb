class Badge < ApplicationRecord
  has_and_belongs_to_many :Users
end
