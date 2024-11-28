class SurveysController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    
    @survey.user = current_user
    if @survey.save
      redirect to root_path
    end
  end
end
