require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    User.create(
      username: 'certilremy'
    )
  end

  it 'assigns a new user to @user' do
    get :new
    expect(assigns(:user)).to be_a_new(User)
  end

  it 'action SHOW should redirect to root page if not logged in' do
    get :show, params: { id: user.id }
    expect(response).to redirect_to(root_path)
  end
end
