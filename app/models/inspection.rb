class Inspection < ApplicationRecord
  belongs_to :establishment
  has_many :infractions

  def status_colour
    panel_colour = { 'Pass': 'success', 'Conditional Pass': 'warning', 'Fail': 'danger' }
    return panel_colour[self.status.to_sym]
  end
end
