class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def new
    build_resource({})
    respond_with resource
  end

  def create
    super
    resource.set_role params["user"]["role"]
  end
end
