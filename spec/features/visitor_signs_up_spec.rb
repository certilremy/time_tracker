require 'spec_helper'
RSpec.describe 'Process to signup and sign out' do
  feature 'Visitor sign up' do
    scenario 'with Valid username' do
      sign_up_with 'certilremy7'
      expect(page).to have_content('Log out')
    end

    scenario 'with invalid username' do
      sign_up_with ''
      expect(page).to have_content("Username can't be blank")
    end

    scenario ' Sign out ' do
    sign_up_with 'certilremy7'
    logout
    expect(page).to have_content('Never confuse managing your time again!')
    end    
  end

end
