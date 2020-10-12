class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  before_save do
    self.email = email.downcase
  end

  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :views, foreign_key: 'viewer_id'
  has_many :votes, foreign_key: 'voter_id'


  def view(question)
    v = View.new(viewer_id: id)
    v.update_attribute :question_id, question.id
  rescue ActiveRecord::RecordNotUnique
  end
end
