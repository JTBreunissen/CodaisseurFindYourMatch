class Match < ApplicationRecord
  belongs_to :first_student_id, class_name => 'User'
  belongs_to :second_student_id, class_name => 'User'
end
