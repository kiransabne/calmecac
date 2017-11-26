module CourseBuilder
  class << self
   def create(title, &block)
     return {} unless block_given?

     course_builder = CourseBuilder::Builder.new(title)
     course_builder.instance_eval(&block)
     course_builder.to_hash
   end
 end
end
