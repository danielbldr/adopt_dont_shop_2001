require 'rails_helper'

RSpec.describe "user visits shelter show page and clicks delete shelter link", type: :feature do
  it "can delete a shelter" do
    shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                              address: "2323 55th St",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")
    shelter2 = Shelter.create(name: "Longmont Humane Society",
                              address: "9595 Nelson Rd",
                              city: "Longmont",
                              state: "CO",
                              zip: "80501")

    visit "/shelters/"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)

    visit "/shelters/#{shelter1.id}"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
