class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def teacher_signed_in?
    current_user&.has_role? :teacher
  end

  def student_signed_in?
    current_user&.has_role? :student
  end

  helper_method :teacher_signed_in?
  helper_method :student_signed_in?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name you_do role avatar])
  end

  def after_sign_up_path_for(resource)
    if resource.has_role? :teacher
      my_courses_path
    elsif resource.has_role? :student
      my_classroom_path
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    if resource.has_role? :teacher
      my_courses_path
    elsif resource.has_role? :student
      my_classroom_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
