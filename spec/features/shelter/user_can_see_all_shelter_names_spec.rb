require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see all shelter names" do
    shelter1 = Shelter.create(name: "Humane Society of Boulder Valley")
    shelter2 = Shelter.create(name: "Longmont Humane Society")

    visit '/shelters'

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
  end
end
