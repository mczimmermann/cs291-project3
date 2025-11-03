require "test_helper"

class ExpertProfileTest < ActiveSupport::TestCase

  test "expert profile that is missing user_id should not save" do
    expert1 = ExpertProfile.new(bio: "Placeholder text for bio")
    assert_not expert1.save, "invalid expert profile (missing user_id) was saved"
  end

  test "expert profile with non-unique user_id should not save" do
    expert2 = ExpertProfile.new(user_id: "42403", bio: "Placeholder text for bio")
    assert expert2.save, "valid expert (expert2) was not saved"
    expert3 = ExpertProfile.new(user_id: "42403", bio: "Placeholder text for bio")
    assert_not expert3.save, "invalid expert profile (duplicate user_id) was saved"
  end

  # note: bio and knowledge_base_links not required
  test "valid expert profile should save" do
    expert4 = ExpertProfile.new(
      user_id: "42403",
    )
    assert expert4.save, "valid expert profile did not save"
  end

end
