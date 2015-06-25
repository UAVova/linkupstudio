class Task < ActiveRecord::Base
  include Tokenable
  belongs_to :user
  belongs_to :status, foreign_key: "status"
  has_many :pictures, :as => :imageable
  accepts_nested_attributes_for :pictures

  validates :title,   presence: true, length: { minimum: 12, maximum: 60  }
  validates :content, presence: true, length: { minimum: 50, maximum: 500 }
end
