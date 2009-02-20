class AddUrlToFaqs < ActiveRecord::Migration
  def self.up
    add_column :faqs, :url, :string
  end

  def self.down
  end
end
