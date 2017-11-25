class Activity < ApplicationRecord
  has_one :reponse, as: :responsable
end
