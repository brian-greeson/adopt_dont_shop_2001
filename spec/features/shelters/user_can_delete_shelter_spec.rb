require "rails_helper"

RSpec.describe "when user", type: :feature do

  it "visits show shelter page can click deltete shelter link" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Delete Shelter')
  end

  it "visits shelters page can click deltete shelter link" do

    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    shelter_2 = Shelter.create(
                              name: "shelter 2",
                              address: "22 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    visit "/shelters/"
    expect(page).to have_link'Delete Shelter', href: "/shelters/#{shelter_1.id}"
    expect(page).to have_link'Delete Shelter', href: "/shelters/#{shelter_2.id}"
  end

  it "clicks delete link a delete request is sent" do
    shelter_1 = Shelter.create(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )

    visit "/shelters/#{shelter_1.id}"

    click_link 'Delete Shelter'
    expect(page).to have_current_path('/shelters')
    expect(page).to have_no_content(shelter_1.name)
  end
end
