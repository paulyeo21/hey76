class Draftee < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :bings, dependent: :destroy
	validates :name, presence: true
end
