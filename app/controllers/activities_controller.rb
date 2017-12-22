class ActivitiesController < ApplicationController
  before_action :set_inscription
  before_action :set_section
  before_action :set_activity

  def update
    authorize @inscription, :update?

    respond_to do |format|
      if SectionManager::Activity.update @inscription, @section, params
        reload_after_update
        format.js { render status: :ok }
      else
        format.js { render status: :unprocessed_entity }
      end
    end
  end

  private

  def set_inscription
    @inscription = Inscription.find(params[:inscription_id])
  end

  def set_section
    _, @section = @inscription.sections.select { |section_id, _section| section_id == params[:section_id] }.first
  end

  def set_activity
    @activity_id, @activity = @section["activities"].select { |activity_id, _activity| activity_id == params[:id] }.first
  end

  def reload_after_update
    @inscription.reload
    set_section
    set_activity
  end
end
