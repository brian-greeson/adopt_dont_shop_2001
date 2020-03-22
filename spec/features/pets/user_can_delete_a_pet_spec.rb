require "rails_helper"

RSpec.describe "when a user" do

  it "visits /pets/:id they see a link to delete the pet" do
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
    visit "/pets/#{pet_1.id}"

    click_on("Delete Pet")

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet_1.name)
    expect(Pet.where(id: pet_1.id)).to eq([])
  end

  it "visits /pets they see a link to delete each pet" do
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
    visit "/pets"

    within(".pet_#{pet_1.id}_details") do
      click_on("Delete Pet")
    end

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet_1.name)
    expect(Pet.where(id: pet_1.id)).to eq([])
  end

  it "visits /shelters/:id/pets they see a link to delete each pet" do
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
    visit "/shelters/#{shelter_1.id}/pets"

    within(".pet_#{pet_1.id}_details") do
      click_on("Delete Pet")
    end

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet_1.name)
    expect(Pet.where(id: pet_1.id)).to eq([])
  end

end
