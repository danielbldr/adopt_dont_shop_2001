require 'rails_helper'

RSpec.describe "user see's a view all shelters link on every page", type: :feature do
  it "will navigate to the shelters show page" do
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
                    shelter: shelter1,
                    description: "Kahlua is a english cream golden retriever. She loves kids and wants to be with an active family.",
                    adoption_status: "Available")
    pet2 = Pet.create(image: '/assets/luna.png',
                      name: 'Luna',
                      age: '2',
                      sex: 'Female',
                      shelter: shelter2,
                      description: "Luna is a mini golden doodle. She loves treats, walks, and chasing squirrels.",
                      adoption_status: "Available")

    visit "/shelters/#{shelter1.id}"
    click_link 'View Pets From This Shelter'

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
    expect(page).to have_css("img[src*='kahlua.png']")
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).not_to have_css("img[src*='luna.png']")
    expect(page).not_to have_content(pet2.name)

    visit "/shelters/#{shelter2.id}"
    click_link 'View Pets From This Shelter'

    expect(current_path).to eq("/shelters/#{shelter2.id}/pets")
    expect(page).to have_css("img[src*='luna.png']")
    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.sex)
    expect(page).not_to have_css("img[src*='kahlua.png']")
    expect(page).not_to have_content(pet1.name)

  end
end
