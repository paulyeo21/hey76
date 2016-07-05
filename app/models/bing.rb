class Bing < ActiveRecord::Base
  belongs_to :draftee
  validates :draftee, :description, :url, presence: true
  validates :title, uniqueness: true
end
