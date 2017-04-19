class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :match1st, :class_name => 'Match', :foreign_key => 'first_student_id'
   has_many :match2nd, :class_name => 'Match', :foreign_key => 'second_student_id'

end
