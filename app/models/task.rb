class Task < ApplicationRecord
  belongs_to :user
  
  
  
  validates :note_name,  presence: true, length: { maximum: 10 }
  validates :note, presence: true, length: { maximum: 100, minimum: 6 }
end
