class AddTechDetailsToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :os, :string
    add_column :tickets, :email_client, :string
    add_column :tickets, :browser, :string
  end

  def self.down
  end
end
