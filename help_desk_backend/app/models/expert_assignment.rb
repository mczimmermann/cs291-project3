class ExpertAssignment < ApplicationRecord

    validates :conversation_id, presence: true
    validates :expert_id, presence: true
    validates :assigned_at, presence: true

    # sets default status to "Active"
    before_save :set_default_string_if_blank

    private
  
    def set_default_string_if_blank
      self.status = "Active" if self.status.blank?
    end
end
