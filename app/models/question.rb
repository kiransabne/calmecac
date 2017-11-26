class Question < ApplicationRecord
  resourcify
  has_one :reponse, as: :responsable
end
