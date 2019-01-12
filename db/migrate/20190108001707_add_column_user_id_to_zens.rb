class AddColumnUserIdToZens < ActiveRecord::Migration[5.2]
  def change
    add_reference :zens, :user, foreign_key: true
  end
end
