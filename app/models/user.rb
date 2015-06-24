class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :telephone, presence: true, phone: true, 
  									    length: { maximum: 25 }
  validates :username,  presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, 
  									    length: { minimum: 3, maximum: 12 }
end
