require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) do
    User.create(
      username: 'certilremy'
    )
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get #Logout' do
    it 'returns http success' do
      login(user)
      get :logout
      expect(response).to redirect_to(root_path)
    end
  end
end
