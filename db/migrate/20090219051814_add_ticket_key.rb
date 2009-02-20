class AddTicketKey < ActiveRecord::Migration
  def self.up
    add_column :tickets, :key, :string
  end

  def self.down
  end
end
