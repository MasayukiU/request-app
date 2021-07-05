class Item < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :regular

	has_one_attached :image

	with_options presence: true do
    validates :quantity
    validates :price
    validates :total_price
  end

	belongs_to :user
	has_many :approvals, dependent: :destroy
	has_many :disapprovals, dependent: :destroy

	validates :price, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
