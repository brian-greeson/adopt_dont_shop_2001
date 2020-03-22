require "rails_helper"

RSpec.describe "when user " do

  it "visits Pet show page sees a link to update pet" do
    visit "pets/#{pet_1.id}"

    click_on "update_pet"

    expect(current_path).to eq("pets/#{pet_1.id/edit}")
  end

end
