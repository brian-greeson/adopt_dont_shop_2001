require "rails_helper"

describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presnce_of :name}
    it {should validate_presnce_of :address}
    it {should validate_presnce_of :state}
    it {should validate_presnce_of :city}
    it {should validate_presnce_of :zip}

    describe "relationships" do
      it {should have_many :pets}
    end

    describe "instance methods" do

    end
  end
end
