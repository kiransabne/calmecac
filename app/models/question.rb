class Question < ApplicationRecord
  has_one :reponse, as: :responsable
end
