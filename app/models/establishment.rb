class Establishment < ApplicationRecord
  has_many :inspections
  has_many :infractions, through: :inspections

  def last_status
    # Returns the latest inspection's status attribute
    inspections.order('date DESC').first.status
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%") 
  end
end