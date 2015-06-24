class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :status, foreign_key: "status"
  
  validates :title,   presence: true, length: { minimum: 12, maximum: 60}
  validates :content, presence: true, length: { minimum: 50, maximum: 500 }
end
