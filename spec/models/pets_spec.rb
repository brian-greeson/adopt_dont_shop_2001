require "rails_helper"

describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :image}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :age}
    it {should validate_presence_of :shelter_id}

    describe "relationships" do
      it {should belong_to :shelter}
    end

    describe "instance methods" do
    end
  end
end
