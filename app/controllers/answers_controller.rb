class AnswersController < ApplicationController
  include AuthenticationHelper

  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:new, :update, :destroy, :edit]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    current_user.view @question if current_user
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_path(@question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def answer
    @answer = Answer.new answer_params

    if @answer.save
      redirect_to question_path(@answer.question)
    else
      flash.alert = "something wrong happened"
      redirect_back fallback_location: question_path(@answer.question)
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    q = @answer.question
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_path(q), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find params[:id]
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :description)
  end

  def answer_params
    params.require(:answer).permit(:body, :user_id, :question_id)
  end
end
