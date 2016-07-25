class CreateUploadLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :upload_logs do |t|
      t.datetime :date_uploaded
      t.string :file_name
      t.integer :establishments_created
      t.integer :inspections_created
      t.integer :infractions_created

      t.timestamps
    end
  end
end
