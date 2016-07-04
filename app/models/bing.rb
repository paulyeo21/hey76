class Bing < ActiveRecord::Base
  belongs_to :draftee
  validates :draftee, :description, :url, presence: true
end
