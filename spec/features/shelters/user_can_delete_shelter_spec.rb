require "rails_helper"

RSpec.describe "when user", type: :feature do
  shelter_1 = Shelter.create(
                            name: "shelter 1",
                            address: "111 shelter dr",
                            city: "Shelterville",
                            state: "Sheltelvania",
                            zip: "01234"
                          )

  it "visits show shelter page can click deltete shelter link" do
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Delete Shelter')
    expect(page.find('Delete Shelter').method).to eq 'DELETE'
  end

  it "clicks delete link a delete request is sent" do
    visit "/shelters/#{shelter_1.id}"

    click_link 'Delete Shelter'

    expect(page).to have_current_path('/shelters')
    expect(page).to have_no_content(shelter_1.name)
  end
end
