require 'rails_helper'

RSpec.describe InscriptionsController, type: :controller do
  before(:each) do
    sign_in_student
  end

  describe "GET index" do
    it "returns a success response" do
      inscription = create(:inscription)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      inscription = create(:inscription)
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      inscription = create(:inscription)
      get :index, params: {id: inscription.to_param}
      expect(response).to be_success
    end
  end

end
