class Draftee < ActiveRecord::Base
	draft_candidates = ["tyus jones", "jahlil okafor", "frank kaminsky"]

	before_validation {self.name = name.downcase}
	validates :name, presence: true, length: {maximum: 50}, 
									 inclusion: {in: draft_candidates},
									 uniqueness: {case_sensitive: false}
end
