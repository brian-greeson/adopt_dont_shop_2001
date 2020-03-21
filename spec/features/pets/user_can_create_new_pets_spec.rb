require "rails_helper"

RSpec.describe "when a user", type: :feature do
  it "visits /shelters/:id/pets can click new pet link" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Create Pet")
  end

  it "clicks on create pet link is shown create pet form" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Create Pet"

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets/new")
  end

  it "Enters form information and clicks create pet, new pet is created" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )

    visit "/shelters/#{shelter_1.id}/pets/new"

    pet_3 = Pet.new(
                      name: "pet 3",
                      image: "5c6a.gif",
                      age: 3,
                      sex: "arizona",
                      shelter_id: shelter_1.id,
                      adoption_status: "available",
                      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
                    )

    fill_in "pet[name]", with: pet_3.name
    fill_in "pet[age]", with: pet_3.age
    fill_in "pet[sex]", with: pet_3.sex
    attach_file 'pet[image]', '/Users/briangreeson/Pictures/puppies/5c6a.gif'
    click_button "Create Pet"

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(pet_3.name)

    expect(Pet.last.name).to eq(pet_3.name)
    expect(Pet.last.age).to eq(pet_3.age)
    expect(Pet.last.sex).to eq(pet_3.sex)
    expect(Pet.last.image).to eq(pet_3.image)
  end
end
