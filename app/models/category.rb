class Category < ActiveRecord::Base
  has_many :records

  validates :title, presence: true
  validates :title, length: { maximum: 200 }
end
