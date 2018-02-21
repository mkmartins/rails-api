class Item < ApplicationRecord
  has_many :points
  accepts_nested_attributes_for :points
end
