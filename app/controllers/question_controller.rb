class QuestionController < ApplicationController

  # {<Question_Id>: <option_type>} ===> [{2: "Interovert"},...]
  @@q_result = {}

  def start
    @ur_personality = @@q_result.values.max_by {|i| @@q_result.values.count(i)} unless @@q_result.nil?
  end

  def index
    @questions = get_questions.sample(5)
  end

  def result
    @@q_result = params.select{ |e| e.starts_with? 'q'}
    redirect_to :start
  end

  private
  def get_questions
    JSON.parse(REDIS.get('QUESTIONS'))
  end

end
