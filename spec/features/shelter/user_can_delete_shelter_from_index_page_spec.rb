require 'rails_helper'

RSpec.describe "On shelter index page user can click delete shelter link", type: :feature do
  it "deletes the shelter" do
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


    delete_shelters_path = "/shelters/#{shelter1.id}"

    visit '/shelters'
    find("a[href='#{delete_shelters_path}']", :text => "Delete Shelter").click

    expect(page).to have_current_path("/shelters")
    expect(page).to have_content(shelter2.name)
    expect(page).to_not have_content(shelter1.name)
  end
end
