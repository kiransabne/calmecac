module CourseBuilder
  class Builder
    def initialize(name)
      @data = {
        name: name,
        description: "",
        objectives: [],
        sections: [],
        exam: {}
      }
    end

    def section(title, &block)
      return unless block_given?

      section_builder = CourseBuilder::Section.new(title)
      section_builder.instance_eval(&block)

      @data[:sections] << section_builder.to_hash
    end

    def exam(&block)
      return unless block_given?

      exam_builder = CourseBuilder::Exam.new
      exam_builder.instance_eval(&block)

      @data[:exam] = exam_builder.to_hash
    end

    def description(content)
      return if content.blank?

      @data[:description] = content
    end

    def objective(content)
      return if content.blank?

      @data[:objectives] << content
    end

    def to_hash
      @data
    end
  end
end
