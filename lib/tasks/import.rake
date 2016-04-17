require 'csv'

namespace :db do
  desc "load data from csv"
  task :load_from_csv  => :environment do
    CSV.open('lib/tasks/ruby_quiz.csv', 'r').each do |row|
      Question.create(question: row[0], skill: row[1], answer: row[2])
    end
  end

end