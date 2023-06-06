require 'rails_helper'

RSpec.describe User, type: :model do
  context 'When a create a user' do
    user = User.create
  end
end
