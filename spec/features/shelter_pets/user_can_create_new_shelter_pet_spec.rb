require 'rails_helper'

RSpec.describe "when user clicks create pet", type: :feature do
  describe "they can fill in a form that creates a new pet" do
    it "has an image, name, description, approximate age, and sex" do
      shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                                address: "2323 55th St",
                                city: "Boulder",
                                state: "CO",
                                zip: "80301")

      visit "/shelters/#{shelter1.id}/pets/new"

      fill_in('Name', with: 'Kahlua')
      fill_in('Description', with: 'Kahlua is a english cream golden retriever.
                    She loves kids and wants to be with an active
                    family.')
      fill_in('Approximate Age', with: '4')
      fill_in('Sex', with: 'Female')
      fill_in('Image', with: 'https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg')

      click_button 'Create Pet'

      expect(page).to have_current_path("/shelters/#{shelter1.id}/pets")
      expect(page).to have_content('Kahlua')
      expect(page).to have_content('Female')
      expect(page).to have_content('Kahlua is a english cream golden retriever. She loves kids and wants to be with an active family.')
      expect(page).to have_content('4')
      expect(page).to have_css("img[src*='https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg']")
      expect(page).to have_content('Adoptable')

    end
  end
end
