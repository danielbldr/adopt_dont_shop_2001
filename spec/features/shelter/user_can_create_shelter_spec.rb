require 'rails_helper'

RSpec.describe "create new shelter", type: :feature do
  it "can create a new shelter" do
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

    visit '/shelters'
    click_on 'New Shelter'

    expect(current_path).to eq("/shelters/new")
    fill_in('Name:', with: 'Humane Society Of The South Platte Valley')
    fill_in('Address', with: '2129 W Chenango Ave')
    fill_in('City', with: 'Littleton')
    fill_in('State', with: 'CO')
    fill_in('Zip', with: '80120')
    click_button 'Create Shelter'
    expect(page).to have_current_path("/shelters")
    expect(page).to have_content('Humane Society Of The South Platte Valley')
  end
end
