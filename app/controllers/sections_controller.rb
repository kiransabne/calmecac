class SectionsController < ApplicationController
  before_action :set_inscription
  before_action :set_section

  def show
    authorize @inscription, :show?
  end

  def update
    authorize @inscription, :exam?

    SectionManager::Exam.update @inscription, @section, params
    redirect_to my_classroom_path
  end

  private

  def set_inscription
    @inscription = Inscription.find(params[:inscription_id])
  end

  def set_section
    @section_id, @section = @inscription.sections.select { |section_id, _section| section_id == params[:id] }.first
  end

  def reload_after_update
    @inscription.reload
    set_section
  end
end
