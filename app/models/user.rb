class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :dealings, foreign_key: 'author_id'
  has_many :groups, foreign_key: 'user_id'
end
