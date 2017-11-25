class User < ApplicationRecord
  has_and_belongs_to_many :badges
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable
end
