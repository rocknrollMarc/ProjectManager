require 'spec_helper'

feature "Viewing tickets" do
  before do
    rocknroll = FactoryGirl.create(:project, name: "rocknroll" )

    FactoryGirl.create(:ticket, project: rocknroll, title: "Make it shiny!",
                      description: "Gradients! Starbursts! Oh my!")

    internet_explorer = FactoryGirl.create(:ticket,
                                          project: internet_explorer,
                                          title: "Standards compliance",
                                          description: "Isn't a joke.")

    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "rocknroll"

    expect(page).to have_content("Make it shiny!")
    expect(page).to have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end
