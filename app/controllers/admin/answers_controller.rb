class Admin::AnswersController < Admin::BaseController
  before_action :set_answer, only: %i[destroy edit show update]
  before_action :set_question, only: %i[create new]

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to [:admin, @answer]
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer]
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy

    redirect_to [:admin, @answer.question]
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct, :sort)
    end

    def set_question
      @question = Question.find(params[:question_id])
    end
end
