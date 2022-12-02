class QuestionController < ApplicationController

  # {<Question_Id>: <option_type>} ===> [{"2": "Interovert"},...]
  @@results = {}

  def index
    @question = Question::DATA[0]
    if @@results.length == 5
      @ur_personality = @@results.values.max_by {|i| @@results.values.count(i)}
    end
    @@results={}
  end

  def show
    @question_count = @@results.length + 1
    @question = Question::DATA.select{|obj| !@@results.key?(obj[:id])}.sample  # because it returns an array., sample is used to take randomly anyone from it

    redirect_to root_path if @@results.length == 5
  end

  def add_result
    @@results[params[:question_id].to_i] = params[:option_type]
    redirect_to question_path(params[:question_id])
  end

end
