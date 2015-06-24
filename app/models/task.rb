class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :status, foreign_key: "status"
end
