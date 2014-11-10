require 'rails_helper'

feature "People" do

  scenario "Create a person with valid data" do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Test"
    fill_in "Date of birth", with: "10/11/1985"
    click_on "Create Person"
    expect(page).to have_content("Person saved successfully")
    expect(page).to have_content("Joe")
    expect(page).to have_content("Test")
  end

  scenario "Create a person missing first name" do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "Last name", with: "Test"
    fill_in "Date of birth", with: "10/11/1985"
    click_on "Create Person"
    expect(page).to have_content("First name can't be blank ")
  end

  scenario "Create a person missing last name" do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "First name", with: "Joe"
    fill_in "Date of birth", with: "10/11/1985"
    click_on "Create Person"
    expect(page).to have_content("Last name can't be blank ")
  end

  scenario "Create a person missing date of birth" do
    visit root_path
    click_on "People"
    click_on "New Person"
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Test"
    click_on "Create Person"
    expect(page).to have_content("Date of birth can't be blank")
  end
end
