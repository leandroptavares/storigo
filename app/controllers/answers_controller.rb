class AnswersController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @survey = Survey.find(params[:survey_id])
    @answer = @survey.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.json { render json: { message: "success" }, status: :ok }
      else
        format.json { render json: { message: "failure" }, status: :unprocessable_entity }
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
