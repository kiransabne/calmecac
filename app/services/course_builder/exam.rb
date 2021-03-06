module CourseBuilder
  class Exam
    def initialize
      @exam = {
        description: "",
        questions: []
      }
    end

    def description(content)
      return if content.blank?

      @exam[:description] = content
    end

    def question(content)
      return if content.blank?

      question = CourseBuilder::Question.new(content)
      @exam[:questions] << question.to_hash
    end

    def to_hash
      @exam
    end
  end
end
