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

    click_on "update_pet"

    expect(current_path).to eq("pets/#{pet_1.id/edit}")
  end

end
