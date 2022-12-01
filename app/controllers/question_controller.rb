class QuestionController < ApplicationController
  # before_action :find_question, only: [ :add_result]
  @@results = []

  def index
    @question = Question.first
    if @@results.length == 5
      @ur_personality = @@results.max_by {|i| @@results.count(i)}
      @@results.clear()
    end
  end

  def show;
    @question = Question.where('id > ?', params[:id]).first
    if @question.nil?
      redirect_to root_path
    end
  end

  def add_result
    puts '<--------------------------->'
    puts @@results
    puts '<--------------------------->'
    @@results.push(params[:option_type])
    redirect_to question_path(params[:question_id])
  end

  # private
  # def find_question
  #   @question = Question.where('id > ?', params[:id]).first
  # end

end
