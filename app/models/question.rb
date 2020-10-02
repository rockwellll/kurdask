class Question < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :answers

  validates :description, presence: true
  validates :title, presence: true

  before_save do
    self.title = title.split(" ").join("-")
  end

  def to_param
    title
  end

  def formatted_title
    title.split("-").join(" ");
  end
end
