require 'rails_helper'

RSpec.describe "test user can create new shelters", type: :feature do
  it "creates a shelter" do

    visit "/shelters"
    click_link "New Shelter"

    expect(current_path).to eq("/shelters/new")

    fill_in "Name", with: "Downtown Puppy Shelter"
    fill_in "Address", with: "4567 Broad Street"
    fill_in "City", with: "Philadelphia"
    fill_in "State", with: "Pennsylvania"
    fill_in "Zip", with: "19019"
    click_button "Submit"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Downtown Puppy Shelter")

    click_link "Downtown Puppy Shelter"
    expect(page).to have_content("Downtown Puppy Shelter")
    expect(page).to have_content("4567 Broad Street")
    expect(page).to have_content("Philadelphia")
    expect(page).to have_content("Pennsylvania")
    expect(page).to have_content("19019")
  end
end
