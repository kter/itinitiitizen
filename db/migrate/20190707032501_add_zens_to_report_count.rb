class AddZensToReportCount < ActiveRecord::Migration[5.2]
  def change
    add_column :zens, :report_count, :integer, default: 0, null: false
    add_column :zens, :spam, :boolean, default: false, null: false
  end
end
