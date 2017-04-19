class AddNoteammateToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :no_teammate, :boolean, default: false
  end
end
