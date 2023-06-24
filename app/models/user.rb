class User < ApplicationRecord

  has_many :rooms
  has_many :reservations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, length: {maximum: 50}

  mount_uploader :avatar, AvatarUploader

  

end
