class Category < ApplicationRecord
  # Validations
  validates :name, presence:true, uniqueness:true
  
  # Associations
  has_one_attached :cover
  has_many :photo, dependent: :nullify
  has_many :comment, as: :commentable, dependent: :destroy
end
