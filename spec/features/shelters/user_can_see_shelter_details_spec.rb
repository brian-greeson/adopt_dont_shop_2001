require "rails_helper"

RSpec.describe "as a user", type: :feature do
  it "can visit /shelters/:shelter_id", type: :feature do
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

  visit "/shelters/#{shelter_1.id}"

  expect(page).to have_content(shelter_1.name)
  expect(page).to have_content("Address: #{shelter_1.address}, #{shelter_1.city}, #{shelter_1.state}, #{shelter_1.zip}")

  visit "/shelters/#{shelter_2.id}"

  expect(page).to have_content(shelter_2.name)
  expect(page).to have_content("Address: #{shelter_2.address}, #{shelter_2.city}, #{shelter_2.state}, #{shelter_2.zip}")
  end
end
