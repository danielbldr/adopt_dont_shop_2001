require 'rails_helper'

RSpec.describe "when a user visits a shelter show page", type: :feature do
  it "can click the update shelter link and fill out form with update info" do
    shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                              address: "2323 55th St",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")

    visit "/shelters/#{shelter1.id}"
    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in('Name:', with: 'Humane Society of Boulder')
    fill_in('Address', with: '2323 35th St')
    fill_in('City', with: 'Boulder')
    fill_in('State', with: 'CO')
    fill_in('Zip', with: '80301')
    click_button 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter1.id}")
    expect(page).to have_content('Humane Society of Boulder')
    expect(page).to have_content('2323 35th St')
    expect(page).to have_content('Boulder')
    expect(page).to have_content('CO')
    expect(page).to have_content('80301')
  end
end
