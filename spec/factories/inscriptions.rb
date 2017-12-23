FactoryBot.define do
  factory :inscription do
    assigned false
    status "in_progress"
    course
    user
  end
end
