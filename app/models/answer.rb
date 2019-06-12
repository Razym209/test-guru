 class Answer < ApplicationRecord
  belongs_to :question
  scope :correct, -> { where(correct: true) }
  validates :body, presence: true
  validate :validate_answers_count_max
  private

  def validate_answers_count_max
    if question.answers.count >= Setting.max_answers
      error = "must include from #{Setting.min_answers} to #{Setting.max_answers} answers"
      errors.add(:question_id, error)
    end
  end
end
