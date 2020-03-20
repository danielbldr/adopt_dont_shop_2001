require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  it "can see all shelter info" do
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
    visit "/shelters/#{shelter1.id}/"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)
    expect(page).to have_link("Update Shelter", href:"/shelters/#{shelter1.id}/edit")
    expect(page).to have_link("Delete Shelter")

    visit "/shelters/#{shelter2.id}/"

    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shelter2.address)
    expect(page).to have_content(shelter2.city)
    expect(page).to have_content(shelter2.state)
    expect(page).to have_content(shelter2.zip)
    expect(page).to have_link("Update Shelter", href:"/shelters/#{shelter2.id}/edit")
    expect(page).to have_link("Delete Shelter")
  end
end
