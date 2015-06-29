class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :task

	validates :content, presence: true, length: { minimum: 5, maximum: 200}
	validates :user_id, presence: true
	validates :task_id, presence: true
end