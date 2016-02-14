class Record < ActiveRecord::Base
  belongs_to :category

  validates :category_id, :pl, :ru, presence: true
  validates :pl, :ru, length: { maximum: 200 }
  validates :category_id, numericality: { only_integer: true }
end
