require "rails_helper"

RSpec.describe "when user", type: :feature do
  it "visit index page can click new shelter button" do
    visit '/shelters'

    expect(page).to have_link('Create Shelter')
  end

  it "clicks on create shelter link is shown create shelter form" do
    visit '/shelters'
    click_link 'Create Shelter'

    expect(page).to have_current_path('/shelters/new')
  end

  it "Enters form information and clicks create shelter, new shelter is created" do
    visit '/shelters/new'
    shelter_1 = Shelter.new(
                              name: "shelter 1",
                              address: "111 shelter dr",
                              city: "Shelterville",
                              state: "Sheltelvania",
                              zip: "01234"
                            )
    page.fill_in 'shelter[name]', with: shelter_1.name
    page.fill_in 'shelter[address]', with: shelter_1.address
    page.fill_in 'shelter[city]', with: shelter_1.city
    page.fill_in 'shelter[state]', with: shelter_1.state
    page.fill_in 'shelter[zip]', with: shelter_1.zip
    click_button 'Submit'

    expect(page).to have_current_path('/shelters')

    expect(page).to have_content(shelter_1.name)

    expect(Shelter.last.name).to eq(shelter_1.name)
    expect(Shelter.last.address).to eq(shelter_1.address)
    expect(Shelter.last.city).to eq(shelter_1.city)
    expect(Shelter.last.state).to eq(shelter_1.state)
    expect(Shelter.last.zip).to eq(shelter_1.zip)

  end

end
