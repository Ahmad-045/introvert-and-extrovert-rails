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
    q_index = ([*1..(Question::DATA.length)] - @@results.keys).sample
    @question = Question::DATA.select{|obj| obj[:id] == q_index}.sample

    redirect_to root_path if @@results.length == 5
  end

  def add_result
    @@results[params[:question_id].to_i] = params[:option_type]
    redirect_to question_path(params[:question_id])
  end

  private

end
