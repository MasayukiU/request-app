class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :team
  belongs_to :position

  has_many :items, dependent: :destroy
  has_many :approvals, dependent: :destroy
  has_many :disapprovals, dependent: :destroy

  with_options presence: true do
    validates :email
    validates :name
  end
  
  validates :team_id, numericality: { other_than: 1, message: "選択されていません" } 
  
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
