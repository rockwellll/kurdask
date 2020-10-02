class Comment < ApplicationRecord
  belongs_to :question, or: :answer
  belongs_to :user
end
