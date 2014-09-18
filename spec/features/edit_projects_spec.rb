require 'spec_helper'

feature "Editing projects" do
  scenario "Updating a project" do
    FactoryGirl.create(:project, name: "rocknroll")

    visit '/'
    click_link "rocknroll"
    click_link "Edit Project"

    fill_in "Name", with: "rocknroll beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end
end
