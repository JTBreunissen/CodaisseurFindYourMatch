class Courseday < ApplicationRecord
  attr_reader :coursedays

  def initialize
    # set couples to empty array
    @couples = []
    # fill coursedays arrays with couples
    determine_couples
  end

  private

  def determine_couples
    # add nil to array in case of odd amount of students
    users.push(nil) if users.size.odd?
    # amount of coursedays
    coursedays = 45
    # each couple exists of 2 persons, so amount of couples is 1/2 total students
    couples_per_day = teams.size / 2

    # creates amount of coursedays * an empty array
    coursedays.times do |index|
      @coursedays[index+1] = []
      #
      couples_per_day.times do |couple_index|
        @coursedays[index+1] << [users[couple_index], users.reverse[couple_index]]
      end
      users = [users[0]] + users[1..-1].rotate(-1)
    end
  end
end
