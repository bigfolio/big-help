class UpdateMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :attachment_updated_at, :datetime
    add_column :messages, :ticket_id, :integer
  end

  def self.down
  end
end
