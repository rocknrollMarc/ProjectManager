require 'spec_helper'

feature "Creating tickets" do
  before do
    FactoryGirl.create(:project, name: "rocknroll")

    visit '/'
    click_link 'rocknroll'
    click_link "New Ticket"
  end

  scenario "Creating a ticket" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
  end

  scenario "Creating a ticket withought valid attrinutes fails" do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
