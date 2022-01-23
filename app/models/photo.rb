class Photo < ApplicationRecord
  # Validations
  validates :name, presence:true, uniqueness:true
  validates :image, presence: { message: "can't be blank" }
  # Associations
  has_one_attached :image
  belongs_to :category, counter_cache: true
  has_many :comments, as: :commentable, dependent: :destroy
end
