class AddColumnToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :day, :date
  end
end
