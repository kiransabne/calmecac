class Activity < ApplicationRecord
  resourcify
  has_one :reponse, as: :responsable
end
