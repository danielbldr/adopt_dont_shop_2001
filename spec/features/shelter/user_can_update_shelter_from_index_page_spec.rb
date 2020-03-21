require 'rails_helper'

RSpec.describe "On shelter index page user can click update shelter link", type: :feature do
  it "takes them to the edit view page to edit the shelter" do
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

    edit_shelters_path = "/shelters/#{shelter1.id}/edit"
    visit '/shelters'
    find("a[href='#{edit_shelters_path}']").click

    fill_in('name', with: 'Humane Society of Boulder')
    fill_in('address', with: '2323 35th St')
    fill_in('city', with: 'Boulder')
    fill_in('state', with: 'CO')
    fill_in('zip', with: '80301')
    click_button 'Update Shelter'

    expect(page).to have_current_path("/shelters/#{shelter1.id}")
    expect(page).to have_content('Humane Society of Boulder')
    expect(page).to have_content('2323 35th St')
    expect(page).to have_content('Boulder')
    expect(page).to have_content('CO')
    expect(page).to have_content('80301')
  end
end


# [ ] done
#
# User Story 13, Shelter Update From Shelter Index Page
#
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to edit that shelter's info
# When I click the link
# I should be taken to that shelters edit page where I can update its information just like in User Story 5
