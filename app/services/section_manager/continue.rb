module SectionManager
  class Continue
    def initialize(inscription)
      @inscription = inscription
    end

    def redirect_path
      @inscription.sections.each do |section_id, section|
        unless section["completed"]
          return "/inscriptions/#{@inscription.id}/sections/#{section_id}"
        end
      end

      nil
    end
  end
end
