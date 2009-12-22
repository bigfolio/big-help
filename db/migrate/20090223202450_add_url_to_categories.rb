class AddUrlToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :help_url, :string, :default => 'http://www.www.aphotofolio.com/help'
  end

  def self.down
  end
end
