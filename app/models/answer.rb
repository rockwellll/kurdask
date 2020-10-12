class Answer < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :question

  validates :body, presence: true
end
