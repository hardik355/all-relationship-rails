require 'rails_helper'

RSpec.describe PanCard, type: :model do
  it { should belong_to(:user) }
  
  context "When Pan card create" do 
    it "Create Pan Card Record with Valid Data" do
      user = User.create(f_name: "Sam", l_name: "Test", email: "sam@yopmail.com")
      pan_card = PanCard.create!(pan_number: 11115156, user_id: user.id)
      expect(pan_card).to be_valid 
    end 

    it "Create Pan Card Record without User" do
      pan_card = PanCard.create(pan_number: 565564)
      expect(pan_card).to_not be_valid 
    end
  end

end
