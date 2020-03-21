require 'rails_helper'

RSpec.describe "On pet index page user can click Update pet link", type: :feature do
  it "takes them to the edit view page to edit the pet" do
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

    delete_pet_path = "/pets/#{pet1.id}"

    visit '/pets'

    find("a[href='#{delete_pet_path}']").click

    expect(page).to have_current_path("/pets")
    expect(page).to have_content(pet2.name)
    expect(page).to_not have_content(pet1.name)
  end
end
