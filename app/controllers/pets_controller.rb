class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def shelter_pets
    @shelter_id = params[:id]
    @pets = Pet.where(shelter_id: @shelter_id)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
    @pet = Pet.new
  end

  def create
    uploaded_image = params[:pet][:image]
    File.open(Rails.root.join('public', uploaded_image.original_filename), 'wb') do |file|
      file.write(uploaded_image.read)
    end

    Pet.create(
        name:   params[:pet][:name],
        age:    params[:pet][:age],
        sex:    params[:pet][:sex],
        description:  params[:pet][:description],
        shelter_id:   params[:shelter_id],
        image: uploaded_image.original_filename
    )
    redirect_to "/shelters/#{params[:shelter_id]}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    Pet.find(params[:id]).update(
      binding.pry
      # name:     params[:pet][:name],
      # image:  params[:pet][:image],
      # age:     params[:pet][:age],
      # sex:    params[:pet][:sex],
      # shelter_id:      params[:pet][:shelter_id]
    )

    redirect_to '/pets'
  end
  #
  #
  # def destroy
  #   Pet.destroy(params[:id])
  #
  #   redirect_to '/pets'
  # end
  #
end
