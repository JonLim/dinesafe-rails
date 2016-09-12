class AddestablishmentIdOnInspections < ActiveRecord::Migration[5.0]
  def change
    add_index :inspections, :establishment_id
  end
end
