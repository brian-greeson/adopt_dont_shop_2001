require 'rails_helper'

RSpec.describe "test shelters index page", type: :feature do
  it "shows all shelter names on index page" do
    parkside_shelter = Shelter.create(name: "Parkside Shelter",
                                      address: "1234 Main Street",
                                      city: "Denver",
                                      state: "Colorado",
                                      zip: "80212")

    lakeside_shelter = Shelter.create(name: "Lakeside Shelter",
                                      address: "8912 Market Street",
                                      city: "Lakewood",
                                      state: "Colorado",
                                      zip: "80219")

    visit "/shelters"

    expect(page).to have_content(parkside_shelter.name)
    expect(page).to have_content(lakeside_shelter.name)
  end
end
