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

end
