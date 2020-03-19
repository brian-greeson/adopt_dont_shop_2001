require "rails_helper"

RSpec.describe "when user", type: :feature do
  shelter_1 = Shelter.create(
                            name: "shelter 1",
                            address: "111 shelter dr",
                            city: "Shelterville",
                            state: "Sheltelvania",
                            zip: "01234"
                          )

  it "visit show shelter page can click update shelter link" do
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Update Shelter')
  end

  it "clicks on create shelter link is shown update shelter form" do
    visit "/shelters/#{shelter_1.id}"
    click_link 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
  end

  it "enters form information and clicks create shelter, new shelter is created" do
    shelter_2 = Shelter.new(
                              name: "Sheltertron 5000",
                              address: "place",
                              city: "placeville",
                              state: "placeington",
                              zip: "09876"
                            )
    visit "/shelters/#{shelter_1.id}/edit"

    expect(find_field("shelter[name]").value).to have_content(shelter_1.name)
    expect(find_field("shelter[address]").value).to have_content(shelter_1.address)
    expect(find_field("shelter[city]").value).to have_content(shelter_1.city)
    expect(find_field("shelter[state]").value).to have_content(shelter_1.state)
    expect(find_field("shelter[zip]").value).to have_content(shelter_1.zip)

    expect(find_field("shelter[name]").value).to have_no_content(shelter_2.name)
    expect(find_field("shelter[address]").value).to have_no_content(shelter_2.address)
    expect(find_field("shelter[city]").value).to have_no_content(shelter_2.city)
    expect(find_field("shelter[state]").value).to have_no_content(shelter_2.state)
    expect(find_field("shelter[zip]").value).to have_no_content(shelter_2.zip)

    page.fill_in 'shelter[name]', with: shelter_2.name
    page.fill_in 'shelter[address]', with: shelter_2.address
    page.fill_in 'shelter[city]', with: shelter_2.city
    page.fill_in 'shelter[state]', with: shelter_2.state
    page.fill_in 'shelter[zip]', with: shelter_2.zip
    click_button 'Submit'

    expect(page).to have_current_path('/shelters')

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_2.zip)
  end

  end
