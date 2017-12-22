class Inscription < ApplicationRecord
  include Editable

  belongs_to :course
  belongs_to :user

  enum status: %i[in_progress completed]
  delegate :name, :description, :objectives, prefix: true, to: :course

  def owner?(owner)
    user.id == owner.id
  end

  def progress
    SectionManager.progress sections
  end

  def all_sections_completed?
    sections.select { |_section_id, section| section["completed"] && section["completed"] }.count == sections.count
  end
end
