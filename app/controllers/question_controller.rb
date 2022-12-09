class QuestionController < ApplicationController

  # {<Question_Id>: <option_type>} ===> [{2: "Interovert"},...]
  @@results = {}

  def index
    @question = JSON.parse(REDIS.get('QUESTIONS'))[0]
    if @@results.length == 5
      @ur_personality = @@results.values.max_by {|i| @@results.values.count(i)}
    end
    @@results={}
  end

  def show
    @question_count = @@results.length + 1

    # because select returns an array with matching fields.,
    # sample is used to take randomly any one from the array as an object

    @question = JSON.parse(REDIS.get('QUESTIONS')).select{|obj| !@@results.key?(obj['id'])}.sample
    redirect_to root_path if @@results.length == 5
  end

  def create
    reform_data_to_add
  end


  def add_result
    @@results[params[:question_id].to_i] = params[:option_type]
    redirect_to question_path(params[:question_id])
  end


  private
  def reform_data_to_add
    byebug
    questionData = JSON.parse(REDIS.get('QUESTIONS'))
    data = {
      id: questionData[questionData.length-1]['id'] + 1,
      content: params[:question_content],
      options: [
        { content: params[:option_1], option_type: params[:option_type_1] },
        { content: params[:option_2], option_type: params[:option_type_2] },
        { content: params[:option_3], option_type: params[:option_type_3] },
        { content: params[:option_4], option_type: params[:option_type_4] }
      ]
    }
    questionData.push(data)
    REDIS.set('QUESTIONS', questionData.to_json)
  end

end
