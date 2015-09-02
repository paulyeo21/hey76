class Draftee < ActiveRecord::Base
	draft_candidates = ["Tyus Jones", "Jahlil Okafor", "Frank Kaminsky"]

	before_validation {self.name = capitalize_name(self.name)}
	validates :name, presence: true, length: {maximum: 50}, 
									 inclusion: {in: draft_candidates},
									 uniqueness: {case_sensitive: false}

  VALID_TWITTER_INSTAGRAM_HANDLE_REGEX = /\A@?[\w]*\z/
  before_validation {self.twitter = remove_at_symbol(self.twitter)}
  validates :twitter, length: {maximum: 15},
                      format: {with: VALID_TWITTER_INSTAGRAM_HANDLE_REGEX}

  before_validation {self.instagram = remove_at_symbol(self.instagram)}
  validates :instagram, length: {maximum: 30},
                        format: {with: VALID_TWITTER_INSTAGRAM_HANDLE_REGEX}

  def capitalize_name name
    full_name = name.split(' ')
    full_name.each do |name|
      name[0] = name[0].upcase 
    end
    full_name.join(' ')
  end

  def remove_at_symbol input
    input[0] == '@' ? input[1..-1] : input
  end
end
