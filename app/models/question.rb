class Question < ActiveRecord::Base
	# t.string :question
 #    t.string :answer
 #    t.integer :skill

	has_many :grades
	has_many :users, through: :grades




	# def self.next_question(user)
	# 	questions_hash = {}
	# 	self.all.each do |question|
	# 		if question.skill == user.skill_level
	# 			questions_hash[question.id] = user.grades.find_by(question_id: question.id).score
	# 		end	
	# 	end
	# 	 questions_hash
	# 	r = WeightedRandomizer.new(questions_hash)
	# 	 self.find(r.sample)
	# end


	def self.next_question(user)
		grades = user.grades
		questions_hash = {}
		grades.each do |grade| 
			questions_hash[grade.question_id] = grade.score
		end

		qids = Question.where(skill: user.skill_level).pluck(:id)
		qids.each do|id| 
			questions_hash[id] = 1 if questions_hash[id].blank?
		end

		r = WeightedRandomizer.new(questions_hash)
		self.find(r.sample)
	end

	

end

