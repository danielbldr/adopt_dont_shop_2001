require 'rails_helper'

RSpec.describe "When use visits pet show page and clicks update pet", type: :feature do
  it "can update all pet information" do
    shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                              address: "2323 55th St",
                              city: "Boulder",
                              state: "CO",
                              zip: "80301")
    pet1 = Pet.create(image: '/assets/kahlua.png',
                      name: 'Kahlua',
                      age: '4',
                      sex: 'Female',
                      adoption_status: "Adoptable",
                      shelter_id: shelter1.id,
                      description: 'Kahlua is a english cream golden retriever. She loves kids and wants to be with an active family.')

    visit "/pets/#{pet1.id}"
    click_on 'Update Pet'

    expect(current_path).to eq("/pets/#{pet1.id}/edit")

    fill_in('Name', with: 'Kahlua')
    fill_in('Approximate Age', with: '5')
    fill_in('Adoption Status', with: 'Pending')
    fill_in('Image', with: 'https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg')

    click_button 'Submit'

    save_and_open_page

    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content('Kahlua')
    expect(page).to have_content('Female')
    expect(page).to have_content('Kahlua is a english cream golden retriever. She loves kids and wants to be with an active family.')
    expect(page).to have_content('5')
    expect(page).to have_css("img[src*='https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg']")
    expect(page).to have_content('Pending')
  end
end
