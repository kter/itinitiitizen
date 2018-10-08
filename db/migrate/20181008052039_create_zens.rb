class CreateZens < ActiveRecord::Migration[5.2]
  def change
    create_table :zens do |t|
      t.text :content, null: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
  end
end
