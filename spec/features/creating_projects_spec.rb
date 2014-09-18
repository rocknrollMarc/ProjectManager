require 'spec_helper'

feature 'Creating Projects' do

  before do
    visit '/'

    click_link 'New Project'
  end
  scenario "can create a project" do
    fill_in 'Name', with: 'rocknroll'
    fill_in 'Description', with: 'A big real bad rocknroller'

    click_button 'Create Project'

    project = Project.where(name: "rocknroll").first

    expect(page.current_url).to eql(project_url(project))

    title = "rocknroll - Project - ProjectManager"
    expect(page).to have_title(title)

    expect(page).to have_content('Project has been successfully created.')
  end

  scenario "can not create a project without a name" do
    click_button 'Create Project'

    expect(page).to have_content("Project has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
