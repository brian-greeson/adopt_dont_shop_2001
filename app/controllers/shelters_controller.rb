class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def create
    Shelter.create(
      name:     params[:shelter][:name],
      address:  params[:shelter][:address],
      city:     params[:shelter][:city],
      state:    params[:shelter][:state],
      zip:      params[:shelter][:zip]
    )
    redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def update
    Shelter.find(params[:id]).update(
                                      name: params[:shelter][:name],
                                      address: params[:shelter][:address],
                                      city: params[:shelter][:city],
                                      state: params[:shelter][:state],
                                      zip: params[:shelter][:zip]
                                    )

    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def destroy
  end

  def new
  end
end
