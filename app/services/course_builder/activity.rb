module CourseBuilder
  class Activity
    def initialize(title)
      @activity = {
        title: title,
        activity: "",
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

      @activity[:questions] << content
    end

    def to_hash
      @activity
    end
  end
end
