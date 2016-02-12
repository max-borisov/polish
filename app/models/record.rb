class Record < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :title, length: { maximum: 200 }
end
