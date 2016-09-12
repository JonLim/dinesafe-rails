class Establishment < ApplicationRecord
  has_many :inspections
  has_many :infractions, through: :inspections

  def last_status
    # Returns the latest inspection's status attribute
    inspections.order('date DESC').first.status
  end
  
  def last_date
    # Returns the latest inspection's date attribute
    inspections.order('date DESC').first.date
  end
  

  def self.search(search)
    where("name ILIKE ?", "%#{sanitize_sql_like(search)}%") 
  end
end