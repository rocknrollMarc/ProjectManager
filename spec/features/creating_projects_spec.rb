require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'rocknroll'
    fill_in 'Description', with: 'A big real bad rocknroller'

    click_button 'Create Project'

    expect(page).to have_content('Project has been created.')
  end
end
