module SectionManager
  class << self
    def progress(sections)
      progress = SectionManager::Progress.new(sections)
      progress.process
    end

    def continue(sections)
      SectionManager::Continue.new(sections).redirect_path
    end

  end

  module Activity
    class << self
      def update(inscription, section, params)
        _, activity = section["activities"].select { |activity_id, activity| activity_id == params[:id] }.first
        params["activity"]["questions"].each do |param_question_id|
          _, question = activity["questions"].select { |question_id, question| question_id == param_question_id }.first

          if question
            question = question.merge!({ "answer" => params["activity"]["questions"][param_question_id] })
            activity["questions"][param_question_id] = question
          end
        end

        activity["completed"] = true
        section["activities"][params[:id]] = activity
        inscription.sections[params[:section_id]] = section
        inscription.save
      end
    end
  end

  module Exam
    class << self
      def update(inscription, section, params)
        params["exam"]["questions"].each do |param_question_id|
          _, question = section["exam"]["questions"].select { |question_id, question| question_id == param_question_id }.first

          if question
            question = question.merge!({ "answer" => params["exam"]["questions"][param_question_id] })
            section["exam"]["questions"][param_question_id] = question
          end
        end
        section["exam"]["score"] = 100
        section["completed"] = true
        inscription.sections[params[:id]] = section

        if inscription.all_sections_completed?
          inscription.status = :completed
        else
          inscription.status = :in_progress
        end

        inscription.save
      end
    end
  end
end
