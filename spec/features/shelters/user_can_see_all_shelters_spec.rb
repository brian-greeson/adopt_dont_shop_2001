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

  # it "can visit /shelters/:shelter_id", type: :feature do
  #   expect(page).to have_content("Address: #{shelter_1.address},
  #                                          #{shelter_1.city},
  #                                          #{shelter_1.state},
  #                                          #{shelter_1.zip}")
  #   expect(page).to have_content("Address: #{shelter_2.address},
  #                                         #{shelter_2.city},
  #                                         #{shelter_2.state},
  #                                         #{shelter_2.zip}")
  # end
end
