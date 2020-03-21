require 'rails_helper'

RSpec.describe "test can add adoptable pets to specific shelter", type: :feature do
  it "test can add adoptable pets to specific shelter" do
    parkside_shelter = Shelter.create(name: "Parkside Shelter",
                                      address: "1234 Market Street",
                                      city: "Denver",
                                      state: "Colorado",
                                      zip: "80230")

    lakeside_shelter = Shelter.create(name: "Lakeside Shelter",
                                      address: "2914 Freetown Road",
                                      city: "Columbia",
                                      state: "Maryland",
                                      zip: "21044")

    caesar = Pet.create(image: "https://thehappypuppysite.com/wp-content/uploads/2017/10/Cute-Dog-Names-HP-long.jpg",
                        name: "Caesar",
                        approx_age: "4",
                        city: "Denver",
                        sex: "Male",
                        shelter: parkside_shelter)

    livia = Pet.create(image: "https://en.bcdn.biz/Images/2018/6/6/ae2e9240-c42a-4a81-b6d8-ac65af25b827.jpg",
                        name: "Livia",
                        approx_age: "5",
                        city: "Columbia",
                        sex: "Female",
                        shelter: lakeside_shelter)

    visit "/shelters/#{parkside_shelter.id}/pets"
    # click_link "Create Pet"
    #
    # fill_in "Image", with: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/08/alaskan-malamute-card-medium.jpg?bust=1535569398"
    # fill_in "Name", with: "Cicero"
    # fill_in "Description" with: "Cicero loves the outdoors, and needs a best friend!"
    # fill_in "Approximate Age", with: "10"
    # fill_in "Sex", with: "Male"
    #
    # click_button "Create Shelter"
  end
end
