require "rails_helper"

RSpec.describe "when a user", type: :feature do
  shelter_1 = Shelter.create(
                            name: "shelter 1",
                            address: "111 shelter dr",
                            city: "Shelterville",
                            state: "Sheltelvania",
                            zip: "01234"
                          )
  # shelter_2 = Shelter.create(
  #                           name: "shelter 2",
  #                           address: "222 shelter dr",
  #                           city: "Mt Shelty",
  #                           state: "Sheltinois",
  #                           zip: "01234"
  #                         )
  # pet_1 = Pet.create(
  #                           name: "pet 1",
  #                           image: "/assets/5558679305.jpg",
  #                           age: 9,
  #                           sex: "male",
  #                           shelter_id: shelter_1.id
  #                         )
  # pet_2 = Pet.create(
  #                           name: "pet 2",
  #                           image: "/assets/1140.jpg",
  #                           age: 2,
  #                           sex: "taco",
  #                           shelter_id: shelter_1.id
  #                         )

  it "visits /shelters/:id/pets can click new pet link" do
    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Create Pet")
  end

  it "clicks on create pet link is shown create pet form" do
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets/new")
  end

  it "Enters form information and clicks create pet, new pet is created" do
    visit "/shelters/#{shelter_1.id}/pets/new"
    pet_3 = Pet.new(
                      name: "pet 3",
                      image: "/assets/a643.jpg",
                      age: 3,
                      sex: "arizona",
                      shelter_id: shelter_2.id,
                      adoption_status: "available"
                    )

    fill_in "pet[name]", with: shelter_1.name
    fill_in "pet[age]", with: shelter_1.address
    fill_in "pet[sex]", with: shelter_1.city
    # fill_in "pet[image]", with: 'something.jpg'
    click_button "Submit"

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")

    expect(page).to have_content(pet_1.name)

    expect(Pet.last.name).to eq(pet_1.name)
    expect(Pet.last.age).to eq(pet_1.address)
    expect(Pet.last.sex).to eq(pet_1.city)
    expect(Pet.last.image).to eq(pet_1.image)
  end
end
