class Answer < ApplicationRecord
  include Votable

  belongs_to :user
  belongs_to :question

  validates :body, presence: true

  def owner_is?(user)
    user_id == user.id
  end
end
