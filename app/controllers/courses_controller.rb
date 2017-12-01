class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update inscribe]

  def index
    authorize Course
    @courses = Course.all
  end

  def new
    authorize Course
    @course = Course.new
  end

  def edit
    authorize @course
  end

  def create
    authorize Course
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: "Course was successfully created."
    else
      render :new
    end
  end

  def update
    authorize @course

    if @course.update(course_params)
      redirect_to @course, notice: "Course was successfully updated."
    else
      render :edit
    end
  end

  def inscribe
    authorize @course
    inscription = Inscription.new user: current_user,
                                  course: @course,
                                  sections: @course.sections,
                                  status: :in_progress

    if inscription.save
      redirect_to my_classroom_path, notice: "Your inscription was successful."
    else
      redirect_to courses_path, notice: "Your inscription was not sucessful."
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :objectives)
  end
end
