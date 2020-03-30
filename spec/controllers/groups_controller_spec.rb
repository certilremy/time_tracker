require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) do
    User.create(
      username: 'certilremy'
    )
  end

  describe 'GET #new' do
    it 'returns http success' do
      login(user)
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'redirect to root path if not logged in' do
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'Controller Index' do
    it ' redirects to the root_path if not logged in' do
      get :index
      expect(response).to redirect_to(root_path)
    end

    it 'renders INDEX if logged in' do
      login(user)
      get :index
      expect(response).to render_template('groups/index')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      login(user)
      group = Group.create(name: 'Group to show!', user_id: user.id)
      get :show, params: { id: group.id }
      expect(response).to have_http_status(:success)
    end

    it 'Redirect to root if not logged in' do
      group = Group.create(name: 'Group to show!', user_id: user.id)
      get :show, params: { id: group.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
