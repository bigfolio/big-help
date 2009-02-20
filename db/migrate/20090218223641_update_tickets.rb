class UpdateTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :state, :string
  end

  def self.down
  end
end
