require 'spec_helper'

feature "Editing projects" do
  before do
    FactoryGirl.create(:project, name: "rocknroll")
    
    visit '/'
    click_link "rocknroll"
    click_link "Edit Project"
  end

  scenario "Updating a project" do
    FactoryGirl.create(:project, name: "rocknroll")
    fill_in "Name", with: "rocknroll beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end

  scenario "Updating a project with invalid attrinutes is bad" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end
end
