module CourseBuilder
  class Activity
    def initialize(title)
      @activity = {
        title: title,
        url: "",
        questions: []
      }
    end

    def description(content)
      return if content.blank?

      @activity[:description] = content
    end

    def url(content)
      return if content.blank?

      @activity[:url] = content
    end

    def question(content)
      return if content.blank?

      question = CourseBuilder::Question.new(content)
      @activity[:questions] << question.to_hash
    end

    def to_hash
      @activity
    end
  end
end
