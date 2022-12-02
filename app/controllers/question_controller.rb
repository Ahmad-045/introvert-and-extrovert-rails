class QuestionController < ApplicationController

  @@results = {}

  def index
    @question = Question.first
    if @@results.length == 5
      @ur_personality = @@results.values.max_by {|i| @@results.values.count(i)}
    end
    @@results={}
  end

  def show
    @question_count = @@results.length + 1
    @question = Question.where.not(id: @@results.keys).order("RANDOM()").first

    redirect_to root_path if @@results.length == 5

  end

  def add_result
    @@results[params[:question_id]] = params[:option_type]
    redirect_to question_path(params[:question_id])
  end

end
