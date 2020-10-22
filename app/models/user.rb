class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true, format: { without: /\s/ }
  scope :find_by_username_or_old_username, -> (name) { where("username = #{name} OR old_username= #{name}")}

  before_save do
    self.email = email.downcase
    self.username = username.strip
  end

  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :views, foreign_key: 'viewer_id'
  has_many :votes, foreign_key: 'voter_id'


  def view(question)
    views.create! viewable: question rescue ActiveRecord::RecordNotUnique
  end
end
