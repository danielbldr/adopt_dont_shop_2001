class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet = Pet.update({
      name: params[:name],
      sex: params[:sex],
      age: params[:age],
      description: params[:description],
      adoption_status: params[:adoption_status],
      image: params[:image],
    })

    redirect_to "/pets/#{params[:id]}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end
end
