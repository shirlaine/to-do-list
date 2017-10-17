class Tasklist < ApplicationRecord

  has_many :tasks
  validates :title, presence: true

end
