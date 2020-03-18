class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def create
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
