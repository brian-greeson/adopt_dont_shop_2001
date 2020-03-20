require 'rails_helper'

RSpec.describe "test shelters show page", type: :feature do
  it "shows a specific shelter on show page" do
    parkside_shelter = Shelter.create!(name: "Parkside Shelter",
                                      address: "1234 Market Street",
                                      city: "Denver",
                                      state: "Colorado",
                                      zip: "80230")

    lakeside_shelter = Shelter.create!(name: "Lakeside Shelter",
                                      address: "2914 Freetown Road",
                                      city: "Columbia",
                                      state: "Maryland",
                                      zip: "21044")

    visit "/shelters/#{parkside_shelter.id}"

    expect(page).to have_content(parkside_shelter.name)
    expect(page).to have_content(parkside_shelter.address)
    expect(page).to have_content(parkside_shelter.city)
    expect(page).to have_content(parkside_shelter.state)
    expect(page).to have_content(parkside_shelter.zip)
    expect(page).to_not have_content(lakeside_shelter.name)
  end
end
