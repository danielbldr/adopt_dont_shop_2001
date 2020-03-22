require 'rails_helper'

RSpec.describe 'User can click on shelter name', type: :feature do
  it "will nagivate to the shelter show page" do
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

    visit '/shelters'
    click_link 'Humane Society of Boulder Valley'

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    visit '/shelters'
    click_link 'Longmont Humane Society'

    expect(current_path).to eq("/shelters/#{shelter2.id}")

    visit '/pets'
    click_link 'Humane Society of Boulder Valley'

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    visit '/pets'
    click_link 'Longmont Humane Society'

    expect(current_path).to eq("/shelters/#{shelter2.id}")

    visit "/shelters/#{shelter1.id}/pets"
    click_link 'Humane Society of Boulder Valley', match: :first

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    visit "/shelters/#{shelter2.id}/pets"
    click_link 'Longmont Humane Society', match: :first

    expect(current_path).to eq("/shelters/#{shelter2.id}")
  end
end
