class AddEndDateToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :end_date, :date
  end
end
