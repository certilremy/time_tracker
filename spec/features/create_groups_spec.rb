require 'spec_helper'
RSpec.describe 'Process to create group' do
  feature 'Group' do
    scenario 'with ivalid name' do
      sign_up_with 'certilremy7'
      add_group_with('')
      expect(page).to have_content("Name can't be blank")
    end

    scenario 'with valid name' do
      sign_up_with 'certilremy7'
      add_group_with('Noukod')
      expect(page).to have_content('Noukod')
    end

    scenario 'diplay show' do
      sign_up_with 'certilremy7'
      add_group_with('Katkat game')
      expect(page).to have_content('Katkat game')
    end
  end
end
