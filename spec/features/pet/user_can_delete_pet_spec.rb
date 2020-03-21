require 'rails_helper'

RSpec.describe 'when a user visits a pets show page', type: :feature do
  it 'can click the delete pet link to delete a pet' do
    shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                            address: "2323 55th St",
                            city: "Boulder",
                            state: "CO",
                            zip: "80301")
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
                      shelter: shelter1,
                      description: "Luna is a mini golden doodle. She loves treats, walks, and chasing squirrels.",
                      adoption_status: "Available")
    visit '/pets'

    visit "/pets/#{pet1.id}"
    click_link 'Delete Pet'

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content(pet1.name)
    expect(page).to have_content(pet2.name)

  end
end
