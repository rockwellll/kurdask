class View < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :viewer_id, presence: true, uniqueness: { scope: [:user, :question]}
  validates :question_id, presence: true, uniqueness: { scope: [:user, :question]}
end
