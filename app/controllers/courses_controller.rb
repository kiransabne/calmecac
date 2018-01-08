class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update inscribe stats]

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

    params = course_params

    data = CourseBuilder.create params["name"] do
      description params["description"]

      params["objectives"].split(",").each do |goal|
        objective goal
      end

      params["sections"].values.each do |section_params|
        section section_params["name"] do
          section_params["resources"].values.each do |resource_params|
            resource resource_params["name"] do
              link resource_params["link"]
            end
          end

          section_params["activities"].values.each do |activity_params|
            activity activity_params["name"] do
              description activity_params["description"]
              url activity_params["url"]

              activity_params["questions"].values.each do |question_value|
                question question_value
              end
            end
          end

          exam do
            description section_params["exam"].values.first["description"]

            section_params["exam"].values.first["questions"].values.each do |question_value|
              question question_value
            end
          end
        end
      end
    end

    data[:user_id] = course_params[:user_id]

    @course = Course.new(data)

    if @course.save
      redirect_to my_courses_path, notice: "Course was successfully created."
    else
      render :new
    end
  end

  def update
    authorize @course

    params = course_params

    data = CourseBuilder.create params["name"] do
      description params["description"]

      params["objectives"].split(",").each do
        objective "Understand the basic of QED"
        objective "QED with differente metrics"
      end

      params["sections"].values.each do |section_params|
        section section_params["name"] do
          section_params["resources"].values.each do |resource_params|
            resource resource_params["name"] do
              link resource_params["link"]
            end
          end

          section_params["activities"].values.each do |activity_params|
            activity activity_params["name"] do
              description activity_params["description"]
              url activity_params["url"]

              activity_params["questions"].values.each do |question_value|
                question question_value
              end
            end
          end

          exam do
            description section_params["exam"].values.first["description"]

            section_params["exam"].values.first["questions"].values.each do |question_value|
              question question_value
            end
          end
        end
      end
    end

    data[:user_id] = course_params[:user_id]

    if @course.update(data)
      redirect_to my_courses_path, notice: "Course was successfully updated."
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

  def stats
    authorize @course
    @inscriptions = Inscription.where(course: current_user.courses)
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :objectives, :user_id, sections: {})
  end
end
