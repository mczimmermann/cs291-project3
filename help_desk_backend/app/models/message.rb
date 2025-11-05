class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: "User"

  validates :sender_role, presence: true, inclusion: { in: ['initiator', 'expert'] }
  validates :content, presence: true
  validates :is_read, presence: true, inclusion: { in: [true, false] }
  
  before_validation :set_sender_role
  after_create :update_conversation_last_message
  
  def set_sender_role
    self.sender_role ||= if sender == conversation.initiator
        "initiator"
      elsif sender == conversation.assigned_expert
        "expert"
      end
  end
  
  private
  
  def update_conversation_last_message
    conversation.update_column(:last_message_at, created_at)
  end
end