class Inspection < ApplicationRecord
  belongs_to :establishment
  has_many :infractions
end
