class Question < ApplicationRecord
  belongs_to :user
  has_many :comment
  has_many :answer

  validates :description, presence: true
  validates :title, presence: true
end
