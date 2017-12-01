module Editable
  extend ActiveSupport::Concern

  included do
    before_create :activities_and_questions_identificable
    before_create :sections_gradable

    def activities_and_questions_identificable
      sections.each do |section|
        to_hashed_activities = {}

        section["activities"].each do |activity|
          to_hashed_questions = {}

          activity["questions"].each do |question|
            to_hashed_questions.merge!({
                                         "#{SecureRandom.uuid}" => question
                                       })
          end

          activity["questions"] = to_hashed_questions

          activity.merge!({
                            "completed" => false,
                          })

          to_hashed_activities.merge!({
                                        "#{SecureRandom.uuid}" => activity
                                      })
        end

        section["activities"] = to_hashed_activities

        section["exam"].merge!({ "score" => 0})

        to_hashed_questions = {}

        section["exam"]["questions"].each do |question|
          to_hashed_questions.merge!({
                                       "#{SecureRandom.uuid}" => question
                                     })
        end

        section["exam"]["questions"] = to_hashed_questions
      end
    end

    def sections_gradable
      to_hashed_sections = {}

      sections.each do |section|
        section.merge!({
                         "completed" => false,
                       })

        to_hashed_sections.merge!({
                                    "#{SecureRandom.uuid}" => section
                                  })
      end

      self.sections = to_hashed_sections
    end
  end
end
