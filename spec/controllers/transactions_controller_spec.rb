require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
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
  end

  describe 'Controller Index' do
    it ' redirects to the root_path if not logged in' do
      get :index
      expect(response).to redirect_to(root_path)
    end

    it 'renders INDEX if logged in' do
      login(user)
      get :index
      expect(response).to render_template('transactions/index')
    end
    
  end

  describe 'GET #show' do
  
    it 'returns http success' do
      login(user)
      transaction = Transaction.create(name: 'Transaction to show!', amoun: 1, user_id: user.id)
      get :show, params: { id: transaction.id}
      expect(response).to have_http_status(:success)
    end
  end
end
