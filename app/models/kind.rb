class Kind < ApplicationRecord
has_many :badges  
has_many :points  
validates :name, :presence => true
validates :name, :uniqueness => true
end
