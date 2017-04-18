class SetDefaultValueOfIsAdmin2 < ActiveRecord::Migration[5.0]
  def up
    change_column_default :users, :is_admin, false
  end
end
