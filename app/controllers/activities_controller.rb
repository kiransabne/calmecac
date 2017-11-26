class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity, notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @activity.destroy
      redirect_to activities_url, notice: 'Activity was successfully destroyed.'
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:description, :url)
  end
end
