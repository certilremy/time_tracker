require 'spec_helper'
RSpec.describe 'Process to create transaction' do
  feature 'Transaction' do
    scenario 'with ivalid name' do
      sign_up_with 'certilremy7'
      create_transactions
      expect(page).to have_content('First transaction')
    end

    scenario 'with valid name' do
      sign_up_with 'certilremy7'
      create_fake_transactions
      expect(page).to have_content("Name can't be blank")
    end

    scenario 'diplay show' do
      sign_up_with 'certilremy7'
      create_transactions
      expect(page).to have_content('First transaction')
    end
  end
end
