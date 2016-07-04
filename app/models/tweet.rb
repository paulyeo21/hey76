class Tweet < ActiveRecord::Base
  belongs_to :draftee
  validates :draftee, :t_id, presence: true
end
