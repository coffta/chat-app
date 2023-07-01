class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages

  def rooms
    Room.joins(:room_users).where(room_users: { user_id: id })
  end

end
