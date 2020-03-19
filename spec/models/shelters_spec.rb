require "rails_helper"

describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presnce_of :name }
  end

end
