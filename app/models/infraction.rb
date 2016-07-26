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
    end
  end
end
