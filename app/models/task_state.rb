class TaskState < ActiveRecord::Base
  has_many :tasks, foreign_key: "state"
end