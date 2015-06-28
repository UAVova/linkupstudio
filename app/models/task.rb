class Task < ActiveRecord::Base
  include Tokenable
  belongs_to :user
  belongs_to :task_state, foreign_key: "state"
  has_many  :pictures, :as => :imageable
  has_many  :attachments,    :as => :entity
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :attachments
  validates :title,   presence: true, length: { minimum: 12, maximum: 60  }
  validates :content, presence: true, length: { minimum: 50, maximum: 500 }
end
