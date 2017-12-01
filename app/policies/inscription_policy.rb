class InscriptionPolicy < ApplicationPolicy
  class Scope < Scope; end

  def index?
    @user.present?
  end

  def exam?
    @user.has_role?(:student) && @record.owner?(@user)
  end

  def edit?
    @user.has_role?(:student) && @record.owner?(@user)
  end

  def update?
    @user.has_role?(:student) && @record.owner?(@user)
  end

  def show?
    @user.has_role?(:student) && @record.owner?(@user)
  end

  def destroy?
    @user.has_role?(:student) && @record.owner?(@user)
  end
end
