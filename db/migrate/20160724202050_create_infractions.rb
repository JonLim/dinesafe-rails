class CreateInfractions < ActiveRecord::Migration[5.0]
  def change
    create_table :infractions do |t|
      t.integer :inspection_id
      t.string :details
      t.string :severity
      t.string :action
      t.string :court_outcome
      t.decimal :amount_fined

      t.timestamps
    end
  end
end
