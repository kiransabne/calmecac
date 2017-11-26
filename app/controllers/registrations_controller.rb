class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    respond_with self.resource
  end

  def create
    super
    self.resource.set_role params["user"]["role"]
  end
end
