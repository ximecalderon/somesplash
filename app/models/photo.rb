class Photo < ApplicationRecord
  # Validations
  validates :name, presence:true, uniqueness:true
  
  # Associations
  has_one_attached :image
  belongs_to :category, counter_cache: true
  has_many :comment, as: :commentable, dependent: :destroy
end
