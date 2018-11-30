require 'rails_helper'

RSpec.describe AuthController, type: :controller do

  describe "GET #google_oauth2" do
    it "returns http success" do
      get :google_oauth2
      expect(response).to have_http_status(:success)
    end
  end

end
