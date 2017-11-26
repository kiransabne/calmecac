class MyClassroomController < ApplicationController
  def index
    authorize :my_classroom, :index?
  end
end
