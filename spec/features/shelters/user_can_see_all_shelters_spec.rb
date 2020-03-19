require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit /shelters and see names of all shelters" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    shelter_2 = Shelter.create(
                              name: "shelter 2",
                              address: "222 shelter dr",
                              city: "Mt. Shelty",
                              state: "Sheltinnois",
                              zip: "43210"
                            )

  visit "/shelters"

  expect(page).to have_css('h1', text: 'All Shelters')
  expect(page).to have_content(shelter_1.name)
  expect(page).to have_content(shelter_2.name)
  end
end
