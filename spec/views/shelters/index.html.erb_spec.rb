require 'rails_helper'

RSpec.describe "as a visitor", type: :view do
  it "i visit /shelters i see names of all shelters" do
    shelter_1 = Shelter.new(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    shelter_1 = Shelter.new(
                              name: "shelter 2",
                              address: "222 shelter dr",
                              city: "Mt. Shelty",
                              state: "Sheltinnois",
                              zip: "43210"
                            )
  end

  visit '/shelters'

  expect(page).to 
end
