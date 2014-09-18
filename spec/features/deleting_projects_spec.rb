require 'spec_helper'

feature "Deleting projects" do
  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "rocknroll")

    visit '/'
    click_link "rocknroll"
    click_link "Delete Project"

    expect(page).to have_no_content("rocknroll")
  end
end
