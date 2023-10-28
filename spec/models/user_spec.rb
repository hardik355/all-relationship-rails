require 'rails_helper'

RSpec.describe User, type: :model do

  context 'When a create a user' do
    it "Crete user without validation field" do
      user = User.create(f_name: "test")
      expect(user).to_not be_valid
    end

    it "Crete user with valid data" do
      user = User.create(f_name: "test", email: 'testuser@yopmail.com', l_name: 'yyy')
      expect(user).to be_valid
    end
  end

  context 'User Relantionship with other model' do 
    it "User belongs to Pan Card" do 
      user  = User.create(f_name: "Hardik", l_name: 'Test', email: "hardik@yopmail.com")
      pan_card = user.build_pan_card(pan_number: 5554535)
      expect(pan_card.user.id).eql?(user.id)
    end 
  end
   

end
