class Infraction < ApplicationRecord
  belongs_to :inspection

  def severity_priority
    case self.severity
    when 'C - Crucial'
      return 1
    when 'S - Significant'
      return 2
    when 'M - Minor'
      return 3
    when 'NA - Not Applicable'
      return 4
    end
  end

  def severity_colour
    row_colour = { 'S - Significant': 'warning', 'C - Crucial': 'danger' }
    return row_colour[self.severity.to_sym]
  end
end
