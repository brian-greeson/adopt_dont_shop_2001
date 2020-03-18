require "rails_helper"

RSpec.describe "when user", type: :feature do
  it "visit index page can click new shelter button" do
    visit '/shelters'

    expect(page).to have_button('Create Shelter')
  end

end
