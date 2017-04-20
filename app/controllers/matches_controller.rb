class MatchesController < ApplicationController
  def home
  end

  def index
    matches_index = Match.all

    studentmatches = matches_index.select do |match|
      match.first_student_id == current_user.id.to_s || match.second_student_id == current_user.id.to_s
    end

    @studentmatches = studentmatches.select do |match|
      match.day <= Date.today
    end
  end
end
