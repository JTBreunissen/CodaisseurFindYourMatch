class RemoveCouplesFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :couples, :text
  end
end
