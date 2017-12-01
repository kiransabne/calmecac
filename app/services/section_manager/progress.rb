module SectionManager
  class Progress
    def initialize(sections)
      @sections = sections
    end

    def process
      OpenStruct.new completed_sections: @sections.values.select { |s| s[:completed] }.count,
                     total_sections: @sections.count
    end
  end
end
