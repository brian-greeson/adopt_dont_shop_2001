require 'rails_helper'

RSpec.describe "test pet info can be updated", type: :feature do
  it "updates a pet's information on show page" do

    paulas_shelter = Shelter.create(name: "Paula's Precious Puppy Shelter",
                            address: "1234 Market Street",
                            city: "Denver",
                            state: "Colorado",
                            zip: "80014")

    pet_1 = Pet.create(image: "https://upload.wikimedia.org/wikipedia/commons/3/34/Labrador_on_Quantock_%282175262184%29.jpg",
                        name: "Hadrian",
                        approx_age: "8",
                        city: "Denver",
                        sex: "Male",
                        shelter: paulas_shelter)


    visit "/pets/#{pet_1.id}"

    click_link "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")

    fill_in "Image", with: form_tag "https://www.gannett-cdn.com/presto/2019/01/09/USAT/ebae0b75-b22d-4604-9afb-3047d1f8b6f2-DF-18447.jpg?width=660&height=441&fit=crop&format=pjpg&auto=webp"
    fill_in "Name", with: "Cassia"
    fill_in "Description", with: "Cassia is an explorer with a heart of gold!"
    fill_in "Approximate Age", with: "8"
    fill_in "Sex", with: "Female"

    click_button "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Cassia")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_content("Cassia is an explorer with a heart of gold!")
    expect(page).to have_content("8")
    expect(page).to have_content("Female")

    expect(page).to_not have_content("Hadrian")
    expect(page).to_not have_css("img[src*='#{pet_1.image}']")
    expect(page).to_not have_content("Cassia is an explorer with a heart of gold!")
    expect(page).to_not have_content("8")
    expect(page).to_not have_content("Female")
  end
end
