require 'rails_helper'

RSpec.describe "user can see pets", type: :feature do
  it "can see all pets info" do
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
    pet1 = Pet.create(image: '/assets/kahlua.png',
                      name: 'Kahlua',
                      age: '4',
                      sex: 'Female',
                      shelter_id: shelter1.id)
    pet2 = Pet.create(image: '/assets/luna.png',
                      name: 'Luna',
                      age: '2',
                      sex: 'Female',
                      shelter_id: shelter2.id)
    visit '/pets'

    expect(page).to have_css("img[src*='kahlua.png']")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(Shelter.find(pet1.shelter_id).name)

    expect(page).to have_css("img[src*='luna.png']")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(Shelter.find(pet2.shelter_id).name)
  end
end
