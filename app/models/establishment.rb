class Establishment < ApplicationRecord
  has_many :inspections
  has_many :infractions, through: :inspections
end
