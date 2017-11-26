class MyClassroomPolicy < Struct.new(:user, :my_classroom)
  def index?
    user.has_role? :student
  end
end
