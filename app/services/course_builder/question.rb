module CourseBuilder
  class Question
    def initialize(content)
      @question = {
        content: content
      }
    end

    def to_hash
      @question
    end
  end
end
