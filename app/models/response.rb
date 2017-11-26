class Response < ApplicationRecord
  resourcify
  belongs_to :responsable, polymorphic: true
end
