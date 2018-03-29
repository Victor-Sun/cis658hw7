require 'test_helper'

class BugTest < ActiveSupport::TestCase
	def setup
		@bug = Bug.create(title: "Title", description: "This is a description", issue_type: 0, priority: 0, status: 0)
	end
	
	test "bug must be valid" do
		assert @bug.valid?
	end
	
	test "title must be present" do
		@bug.title = ""
		assert_not @bug.valid?
	end
	
	test "description cannot be blank" do
		@bug.description = ""
		assert_not @bug.valid?
	end
	
	test "issue_type must be valid" do
		valid_issue_types = [:issue, :enhancement, :feature]
		valid_issue_types.each do |v|
			begin
				@bug.issue_type v
				assert true
			rescue
				assert false, "#{v} should be invalid"
			end
		end
	end
	
	test "priority must be valid" do
		valid_priorities = [:low, :medium, :high]
		valid_priorities.each do |p|
			begin
				@bug.priority p
				assert true
			rescue
				assert false, "#{p} should be invalid"
			end
		end
	end
	
	
end
