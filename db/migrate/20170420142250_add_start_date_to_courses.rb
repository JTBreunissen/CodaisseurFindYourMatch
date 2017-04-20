class AddStartDateToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :start_date, :date
  end
end
