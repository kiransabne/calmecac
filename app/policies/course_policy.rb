class CoursePolicy < ApplicationPolicy
  class Scope < Scope; end

  def index?
    @user.present?
  end

  def edit?
    @user.has_role? :teacher
  end

  def new?
    @user.has_role? :teacher
  end

  def create?
    @user.has_role? :teacher
  end

  def update?
    @user.has_role? :teacher
  end

  def inscribe?
    @user.has_role? :student
  end
end
