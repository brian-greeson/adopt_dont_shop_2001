require "rails_helper"

RSpec.describe "when user " do

  it "visits Pet show page sees a link to update pet" do
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

    visit "pets/#{pet_1.id}"
    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "visits Pets page sees a link to update each pet" do
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

    visit "/pets/"
    within(".pet_#{pet_1.id}_details") do
      click_on "Update Pet"
    end

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
  end

  it "visits pet edit page they can edit pet" do
    image_filename = "5c6a.gif"
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    shelter_2 = Shelter.create(
                              name: "shelter 2",
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
    pet_2 = Pet.new(
                      name: "pet 2",
                      image: image_filename,
                      age: 10,
                      sex: "female",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit",
                      shelter_id: shelter_2.id
                    )

    visit "/pets/#{pet_1.id}/edit"

    fill_in "pet[name]", with: pet_2.name
    fill_in "pet[age]", with: pet_2.age
    fill_in "pet[sex]", with: pet_2.sex
    fill_in "pet[description]", with: pet_2.description
    select shelter_2.name, from: "pet[shelter_id]"
    attach_file "pet[image]", "/Users/briangreeson/Pictures/puppies/#{image_filename}"
    click_on "Update Pet"

    expect(page).to have_current_path("/pets/#{pet_1.id}")

    pet_result = Pet.find(pet_1.id)

    expect(pet_result.name).to eq(pet_2.name)
    expect(pet_result.age).to eq(pet_2.age)
    expect(pet_result.sex).to eq(pet_2.sex)
    expect(pet_result.description).to eq(pet_2.description)
    expect(pet_result.image).to eq(pet_2.image)
    expect(pet_result.shelter_id).to eq(pet_2.shelter_id)

  end



end
