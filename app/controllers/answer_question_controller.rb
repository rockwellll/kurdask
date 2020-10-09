class AnswerQuestionController < ApplicationController
  include AuthenticationHelper

  before_action :authenticate

  def create
    answer = Answer.new answer_params

    if answer.save
      redirect_to question_path(answer.question)
    else
      flash[:alert] = t 'empty'
      redirect_back fallback_location: question_path(answer.question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end
end
