class QuestionController < ApplicationController

  # {<Question_Id>: <option_type>} ===> [{2: "Interovert"},...]
  @@results = {}

  def index
    @all_questions = get_questions
    @question = @all_questions[0]
    if @@results.length == 5
      @ur_personality = @@results.values.max_by {|i| @@results.values.count(i)}
    end
    @@results={}
  end

  def show
    @question_count = @@results.length + 1

    # because select returns an array with matching fields.,
    # sample is used to take r$('#question-<%= @question_id%>').html('');andomly any one from the array as an object

    @question = get_questions.select{|obj| !@@results.key?(obj['id'])}.sample
    redirect_to root_path if @@results.length == 5
  end

  def create
    @new_question = reshape_data_to_add
  end

  def destroy
    questions = get_questions.select{ |obj| obj['id'] != params[:id].to_i}
    redirect_to root_path, alert: 'Cannot delete the Questions., Minimum Question should be 5' if questions.length <= 4
    @question_id = params[:id]
    REDIS.set('QUESTIONS', questions.to_json)
  end


  def add_result
    @@results[params[:question_id].to_i] = params[:option_type]
    redirect_to question_path(params[:question_id])
  end


  private
  def reshape_data_to_add
    questionData = get_questions
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
    return data
  end

  def get_questions
    JSON.parse(REDIS.get('QUESTIONS'))
  end

end
