class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :telephone, phone: true, length: { maximum: 25 }
  validates :username,  format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { minimum: 3, maximum: 12 }
end
