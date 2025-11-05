require "test_helper"

class ExpertAssignmentTest < ActiveSupport::TestCase
  
  # TESTS FOR ASSIGNMENTS MISSING REQUIRED VALUES
  
  # test "expert assignment that is missing conversation_id should not save" do
  #   expert_assignment1 = ExpertAssignment.new(expert_id: "2", assigned_at: Time.current)
  #   assert_not expert_assignment1.save, "invalid expert assignment (missing conversation_id) was saved"
  # end

  # test "expert assignment that is missing expert_id should not save" do
  #   expert_assignment2 = ExpertAssignment.new(conversation_id: "1", assigned_at: Time.current)
  #   assert_not expert_assignment2.save, "invalid expert assignment (missing expert_id) was saved"
  # end

  # test "expert assignment that is missing assigned_at should not save" do
  #   expert_assignment3 = ExpertAssignment.new(conversation_id: "1", expert_id: "2")
  #   assert_not expert_assignment3.save, "invalid expert assignment (missing expert_id) was saved"
  # end


  # TESTS FOR DEFAULT STATUS

  # test "expert assignment that is missing status should still have status = Active" do
  #   expert_assignment4 = ExpertAssignment.new(
  #     conversation_id: "123",
  #     expert_id: "234",
  #     assigned_at: Time.current,
  #     #status: "Active"
  #   )
  #   assert expert_assignment4.save, "valid expert assignment was not saved"
    
  #   expected_string = "Active"
  #   assert_equal expected_string, expert_assignment4.status, "status is not what was expected"
  # end

  # test "expert assignment that overwrites default status as Inactive should save" do
  #   expert_assignment5 = ExpertAssignment.new(
  #     conversation_id: "1234",
  #     expert_id: "5678",
  #     assigned_at: Time.current,
  #     status: "Inactive"
  #   )
  #   assert expert_assignment5.save, "valid expert assignment was not saved"

  #   expected_string = "Inactive"
  #   assert_equal expected_string, expert_assignment5.status, "status is not what was expected"
  # end

  
  # FINAL VALID ASSIGNMENT TEST

  # test "valid expert assignment should save" do
  #   expert_assignment6 = ExpertAssignment.new(
  #     conversation_id: "1",
  #     expert_id: "2",
  #     assigned_at: Time.current
  #   )
  #   assert expert_assignment6.save, "valid expert assignment did not save"
  # end

end
