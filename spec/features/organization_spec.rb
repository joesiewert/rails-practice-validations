require 'rails_helper'

feature "Organizations" do

  scenario "Create an organization with valid data" do
    visit root_path
    click_on "Organizations"
    click_on "New Organization"
    fill_in "Name", with: "Galvanize"
    click_on "Create Organization"
    expect(page).to have_content("Organization saved successfully")
    expect(page).to have_content("Galvanize")
  end

  scenario "Create an organization missing name" do
    visit root_path
    click_on "Organizations"
    click_on "New Organization"
    click_on "Create Organization"
    expect(page).to have_content("Name can't be blank ")
  end
end
