require 'spec_helper'

feature "Viewing  projects" do
  scenario "Listing all Projects" do
    project = FactoryGirl.create(:project, name: "rocknroll")

    visit '/'

    click_link "rocknroll"

    expect(page.current_url).to eql(project_url(project))
  end
end
