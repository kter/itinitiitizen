require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :user
  # login_user

  let(:valid_attrigutes) {}
  let(:valid_session) {}

  describe "GET show" do
    it "assigns the requested user as @user" do
      sign_in user(:takahashi)
      get :show, {id: user.to_param}, valid_session
      expect(assigns :story).to eq user
   end
  end

  it "returns name if nickname does not exist" do
    sign_in user(:sato)
    expect(current_user.get_nickname).to include("Sato")
  end

  it "returns nickname if nickname does exist" do
    sign_in user(:takahashi)
    expect(current_user.get_nickname).to include("taka-chan")
  end
end
