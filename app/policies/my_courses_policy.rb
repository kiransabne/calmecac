class MyCoursesPolicy < Struct.new(:user, :my_classroom)
  def index?
    user.has_role? :teacher
  end
end
