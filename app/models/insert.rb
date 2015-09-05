class Insert < ActiveRecord::Base
  belongs_to :draftee
  default_scope -> {order(date: :desc)}
  validates :draftee_id, presence: true
end
