class CreateZens < ActiveRecord::Migration[5.2]
  def change
    create_table :zens do |t|
      t.text :content
      t.boolean :deleted

      t.timestamps
    end
  end
end
