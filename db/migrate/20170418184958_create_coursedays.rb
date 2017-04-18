class CreateCoursedays < ActiveRecord::Migration[5.0]
  def change
    create_table :coursedays do |t|
      t.text :couples, array: true, default: []

      t.timestamps
    end
  end
end
