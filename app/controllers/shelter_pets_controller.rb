class ShelterPetsController < ApplicationController
  def index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    pet = Pet.create(
      name: params[:name],
      sex: params[:sex],
      age: params[:age],
      description: params[:description],
      adoption_status: 'Adoptable',
      image: params[:image],
      shelter_id: params[:shelter_id]
    )

    pet.save
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end
end
