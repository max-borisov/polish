class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { maximum: 200 }
end
