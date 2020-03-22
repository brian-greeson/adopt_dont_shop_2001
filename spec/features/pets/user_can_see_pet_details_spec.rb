require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can visit /shelter/pets/:id and see details of pet" do
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
                              image: "5558679305.jpg",
                              age: 9,
                              sex: "male",
                              shelter_id: shelter_1.id
                            )
    pet_2 = Pet.create(
                              name: "pet 2",
                              image: "1140.jpg",
                              age: 2,
                              sex: "taco",
                              shelter_id: shelter_1.id
                            )
    pet_3 = Pet.create(
                              name: "pet 3",
                              image: "a643.jpg",
                              age: 3,
                              sex: "arizona",
                              shelter_id: shelter_2.id
                            )
    visit "/pets/#{pet_1.id}"


    within("article.pet_#{pet_1.id}_details") do
      expect(find("a.name").text).to eq(pet_1.name)
      expect(find("img")[:src]).to eq("/" + pet_1.image)
      expect(find("p.sex").text).to eq(pet_1.sex.to_s)
      expect(find("p.age").text).to eq(pet_1.age.to_s)
      expect(find("a.shelter").text).to eq(pet_1.shelter.name)
      expect(find("p.status").text).to eq(pet_1.adoption_status)
    end
    expect(page).to have_no_content(pet_2.name)
    expect(page).to have_no_content(pet_3.name)
  end
end
