class Comment < ApplicationRecord
  # Callbacks
  after_create :increment_comments_count
  after_destroy :decrement_comments_count
  
  # Validations
  validates :body, presence:true

  # Associations
  belongs_to :commentable, polymorphic: true

  def increment_comments_count
    if commentable_type == "Photo"
      commented_photo = commentable 
      commented_photo.comments_count += 1
      commented_photo.save
    end
  end

  def decrement_comments_count
    if commentable_type == "Photo"
      commented_photo = commentable
      commented_photo.comments_count -= 1
      commented_photo.save
    end
  end
end
