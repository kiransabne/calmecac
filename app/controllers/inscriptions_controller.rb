class InscriptionsController < ApplicationController
  before_action :set_inscription, only: %i[show edit update destroy]

  def index
    authorize Inscription
    @inscriptions = current_user.inscriptions
  end

  def show
    authorize @inscription
  end

  def edit
    authorize @inscription

    redirect_to SectionManager.continue(@inscription) || @inscription
  end

  def update
    authorize @inscription

    if @inscription.update(inscription_params)
      redirect_to @inscription, notice: "Inscription was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @inscription

    if @inscription.destroy
      redirect_to inscriptions_url, notice: "Inscription was successfully destroyed."
    end
  end

  private

  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:id)
  end
end
