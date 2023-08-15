class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_and_belongs_to_many :dealings
end
