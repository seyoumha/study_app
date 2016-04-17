class QuestionsController < ApplicationController
	before_action :authenticate_user!

	def index
		 @user = current_user
	end

  
  

	def show
    @question = Question.next_question(current_user)
    respond_to do |format|
      format.json { render json: @question }
      format.html
    end

  end

	
  def update
    @question = Question.find(params[:question_id])
    grade = current_user.grades.find_by(question_id: @question.id)
    if grade.present?
        g = grade.update_attributes(question_id: @question.id, user_id: current_user.id, score: params[:score])

    else
        g = Grade.new(question_id: @question.id, user_id: params[:user_id], score: params[:score])
      g.save
    end
    respond_to do |format|
      format.json { render json: g }
    end 

  end

private 


  def grade_params
        params.require(:grade).permit(:score, :question_id, :user_id, :skill)
    end 
end