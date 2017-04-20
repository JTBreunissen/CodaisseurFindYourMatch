class Match < ApplicationRecord
  belongs_to :first_student, :class_name => 'User', :foreign_key => 'first_student_id'
  belongs_to :second_student, :class_name => 'User', :foreign_key => 'second_student_id'

  def self.removeMatches(day)
    #remove current matches for courseday
    existing_matches = Match.where(day: day)
    if existing_matches.length > 0
      existing_matches.each do |match|
        match.destroy
      end
    end
  end

  def self.couplesForCourseday(day)
    day = day.to_date
    couples = makeCouples()

    couples.each do |student|
      new_match = Match.create(first_student: student[0], second_student: student[1], day: day)
    end


    # redirect_to admin_matches_url, notice: "Matches created"
  end

  def self.makeCouples()
    couples = []
    picked_students = []
    # query that returns an array with all students (no admins) as objects
    students = User.all.select { |u| u.is_admin == false }
    # add surrogate user to array if number of students is odd
    students.push(User.find{ |u| u.no_teammate == true}) if students.length.odd?
    # amount of couples per day is total students /2
    couples_per_day = students.length / 2

    couples_per_day.times do
      randomizer_first = rand(students.length)
      first_pick = students[randomizer_first]
      picked_students << students.delete_at(randomizer_first)

      randomizer_second = rand(students.length)
      second_pick = students[randomizer_second]
      picked_students << students.delete_at(randomizer_second)

        couples << [first_pick, second_pick]
      end
    return couples
  end
end
