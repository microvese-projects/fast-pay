class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :dealings
end
