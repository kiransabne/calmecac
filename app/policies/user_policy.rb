class UserPolicy < ApplicationPolicy
  class Scope < Scope; end

  def edit?
    user.id = object.id
  end
end
