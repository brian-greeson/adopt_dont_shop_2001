require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  xit "can visit /shelter/:id/pets and see details of pets available at that shelter" do
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
                              city: "Mt Shelty",
                              state: "Sheltinois",
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
    pet_3 = Pet.create(
                              name: "pet 2",
                              image: "/assets/images/1140.jpg",
                              age: 2,
                              sex: "taco",
                              shelter_id: shelter_2.id
                            )
    visit "/shelters/#{shelter_1.id}/pets"

    Pet.all.each do |pet|
      within("div.pet_#{pet.id}_details") do
        expect("somthing").to eq(pet.name)
        expect("somthing").to eq(pet.image)
        expect("somthing").to eq(pet.sex)
        expect("somthing").to eq(pet.age)
        expect("somthing").to eq(pet.shelter.name)
      end
    end
  end
end
