class CreateInspections < ActiveRecord::Migration[5.0]
  def change
    create_table :inspections, { id: false } do |t|
      t.integer :id
      t.integer :establishment_id
      t.date :date

      t.timestamps
    end
  end
end
