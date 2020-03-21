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
    visit "/pets"
    expect(page).to have_css('h1', text: 'All Pets')

    Pet.all.each do |pet|
      within("article.pet_#{pet.id}_details") do
        expect(find("a.name").text).to eq(pet.name)
        expect(find("img")[:src]).to eq(pet.image)
        expect(find("a.sex").text).to eq(pet.sex.to_s)
        expect(find("a.age").text).to eq(pet.age.to_s)
        expect(find("a.shelter").text).to eq(pet.shelter.name)
      end
    end
  end
end
