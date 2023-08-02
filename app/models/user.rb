class User < ApplicationRecord
  has_one :pan_card, dependent: :destroy
  accepts_nested_attributes_for :pan_card
  # delegate :name, :description, to: :event
end
