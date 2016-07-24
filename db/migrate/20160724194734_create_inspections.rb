class CreateInspections < ActiveRecord::Migration[5.0]
  def change
    create_table :inspections, { id: false } do |t|
      t.primary_key :id
      t.integer :establishment_id
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
