class Question < ApplicationRecord
  belongs_to :organization
  has_many :answers
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
end
