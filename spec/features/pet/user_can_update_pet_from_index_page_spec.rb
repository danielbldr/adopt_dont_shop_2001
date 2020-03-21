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

    edit_pet_path = "/pets/#{pet1.id}/edit"

    visit '/pets'
    find("a[href='#{edit_pet_path}']").click


    expect(current_path).to eq(edit_pet_path)

    fill_in('Name', with: 'Bear')
    fill_in('Approximate Age', with: '5')
    fill_in('Adoption Status', with: 'Pending')
    fill_in('Image', with: 'https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg')

    click_button 'Submit'

    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content('Kahlua')
    expect(page).to have_content('Female')
    expect(page).to have_content('Kahlua is a english cream golden retriever. She loves kids and wants to be with an active family.')
    expect(page).to have_content('5')
    expect(page).to have_css("img[src*='https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg']")
    expect(page).to have_content('Pending')
  end
end
