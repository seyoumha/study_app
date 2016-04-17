class SkillLevelsController < ApplicationController
  def index
  	@user = User.find(params[:user][:id])
  		@user.skill_level = params[:user][:skill_level]
  	@user.save
  	
  	@question = Question.next_question(@user)
  	redirect_to question_path(@question)
  end
end
