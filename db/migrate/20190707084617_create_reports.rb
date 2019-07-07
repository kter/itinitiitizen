class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :zens, foreign_key: true
      t.integer :report_count, default: 0, null: false
      t.boolean :spam, default: false, null: false

      t.timestamps
    end
  end
end
