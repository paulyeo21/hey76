class Post < ActiveRecord::Base
  belongs_to :draftee
  validates :draftee, :content_id, presence: true

  # default_scope -> {order(date: :desc)}
end
