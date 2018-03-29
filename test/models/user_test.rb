require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.create(lname: "LastName", fname: "FirstName", email: "Email@Email.com", thumbnail: "thumbnail.jpg")
	end
	
	test "lname cannot be blank" do
		@user.lname = ""
		assert_not @user.valid?
	end
	
	test "fname cannot be blank" do
		@user.fname = ""
		assert_not @user.valid?
	end

	test "email cannot be blank" do
		@user.email = ""
		assert_not @user.valid?
	end
	
	test "email must be valid" do
		@user.email = "test@test..com"
		assert_not @user.valid?
	end
	
	test "thumbnail must be .jpg .png or .gif" do
		@user.thumbnail = "picture"
		assert @user.thumbnail.include?(".jpg" || ".png" || ".gif")
	end
end
