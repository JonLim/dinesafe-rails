class CreateEstablishments < ActiveRecord::Migration[5.0]
  def change
    create_table :establishments, { id: false } do |t|
      t.integer :id
      t.string :name
      t.string :type
      t.string :address
      t.string :status
      t.integer :min_inspections

      t.timestamps
    end
  end
end
