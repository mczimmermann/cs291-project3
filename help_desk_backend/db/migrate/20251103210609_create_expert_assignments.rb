class CreateExpertAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :expert_assignments do |t|
      t.bigint :conversation_id, null: false
      t.bigint :expert_id, null: false
      t.string :status, null: false
      t.datetime :assigned_at, null: false
      t.datetime :resolved_at

      t.timestamps
    end
  end
end
