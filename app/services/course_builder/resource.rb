module CourseBuilder
  class Resource
    def initialize(title)
      @resource = {
        title: title,
        link: ""
      }
    end

    def link(content)
      @resource[:link] = content
    end

    def to_hash
      @resource
    end
  end
end
