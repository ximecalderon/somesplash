class Category < ApplicationRecord
  # Validations
  validates :name, presence:true, uniqueness:true
  
  # Associations
  has_one_attached :cover
  has_many :photos, dependent: :nullify
  has_many :comments, as: :commentable, dependent: :destroy
end
