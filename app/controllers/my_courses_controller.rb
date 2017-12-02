class MyCoursesController < ApplicationController
  def index
    authorize :my_courses, :index?
    @courses = current_user.courses
  end
end
