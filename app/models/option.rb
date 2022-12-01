class Option < ApplicationRecord
  belongs_to :question
  enum option_type: [:introvert, :extrovert]
end
