class Base < ApplicationRecord
  
  validates :base_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :attendance, presence: true, length: { maximum: 10 }
  
end
