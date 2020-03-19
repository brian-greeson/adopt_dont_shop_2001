require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit /pets and see names,images,age,sex,shelter of all pets" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    pet_1 = Pet.create(
                              name: "pet 1",
                              image: "/assets/images/5558679305.jpg",
                              age: 9,
                              sex: "male",
                              shelter_id: shelter_1.id
                            )
    pet_2 = Pet.create(
                              name: "pet 2",
                              image: "/assets/images/1140.jpg",
                              age: 2,
                              sex: "taco",
                              shelter_id: shelter_1.id
                            )
  visit "/pets"

  expect(page).to have_css('h1', text: 'All Pets')
  expect(page).to have_content(pet_1.name)
  expect(page).to have_content(pet_2.name)
  end
end
