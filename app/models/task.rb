class Task < ApplicationRecord

  belongs_to :tasklist
  validates :name, presence: true

end
