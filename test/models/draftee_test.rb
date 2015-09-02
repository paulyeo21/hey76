require 'test_helper'

class DrafteeTest < ActiveSupport::TestCase

	def setup
		@draftee = Draftee.new(name: "tyus jones")
	end

	test "should be valid" do 
		assert @draftee.valid?
	end

	test "name should be present" do
		@draftee.name = "   "
		assert_not @draftee.valid?
	end

  test "name should not be too long" do
    @draftee.name = "a" * 51
    assert_not @draftee.valid?
  end

  test "name validation should accept draft candidates" do
  	valid_names = ["Tyus Jones", "Jahlil Okafor"]
  	valid_names.each do |name|
  		@draftee.name = name
  		assert @draftee.valid?
  	end
  end

  test "name validation should reject non draft candidates" do
  	valid_names = ["Kobe Bryant", "LeBron James"]
  	valid_names.each do |name|
  		@draftee.name = name
  		assert_not @draftee.valid?
  	end
  end

  test "name should be unique" do
    duplicate_draftee = @draftee.dup
    @draftee.save
    assert_not duplicate_draftee.valid?
  end

end
