module CourseBuilder
  class Section
    def initialize(title)
      @section = {
        title: title,
        resources: [],
        activities: []
      }
    end

    def resource(title, &block)
      return unless block_given?

      resource_builder = CourseBuilder::Resource.new(title)
      resource_builder.instance_eval(&block)

      @section[:resources] << resource_builder.to_hash
    end

    def activity(title, &block)
      return unless block_given?

      activity_builder = CourseBuilder::Activity.new(title)
      activity_builder.instance_eval(&block)

      @section[:activities] << activity_builder.to_hash
    end

    def exam(&block)
      return unless block_given?

      exam_builder = CourseBuilder::Exam.new
      exam_builder.instance_eval(&block)

      @section[:exam] = exam_builder.to_hash
    end

    def to_hash
      @section
    end
  end
end
