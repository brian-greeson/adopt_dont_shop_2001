class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  # def create
  #   Pet.create(
  #     name:     params[:pet][:name],
  #     image:  params[:pet][:image],
  #     age:     params[:pet][:age],
  #     sex:    params[:pet][:sex],
  #     shelter_id:      params[:pet][:shelter_id]
  #   )
  #   redirect_to '/pets'
  # end
  #
  # def show
  #   @pet = Pet.find(params[:id])
  # end
  #
  # def update
  #   Pet.find(params[:id]).update(
  #     name:     params[:pet][:name],
  #     image:  params[:pet][:image],
  #     age:     params[:pet][:age],
  #     sex:    params[:pet][:sex],
  #     shelter_id:      params[:pet][:shelter_id]
  #   )
  #
  #   redirect_to '/pets'
  # end
  #
  # def edit
  #   @pet = Pet.find(params[:id])
  # end
  #
  # def destroy
  #   Pet.destroy(params[:id])
  #
  #   redirect_to '/pets'
  # end
  #
  # def new
  # end
end
