require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit /shelters and see names of all shelters" do
    pet_1 = Pet.create(
                              name: "pet 1",
                              image: "/assets/images/5558679305.jpg",
                              age: 5,
                              sex: "male",
                              shelter_id: 1
                            )
    pet_2 = Pet.create(
                              name: "pet 2",
                              image: "/assets/images/1140.jpg",
                              age: 2,
                              sex: "male",
                              shelter_id: 1
                            )

  visit "/shelters"

  expect(page).to have_css('h1', text: 'All Pets')
  expect(page).to have_content(pet_1.name)
  expect(page).to have_content(pet_2.name)
  end
end
