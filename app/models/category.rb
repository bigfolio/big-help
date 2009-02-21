class Category < ActiveRecord::Base
  
  has_many :faqs
  has_and_belongs_to_many :users, :join_table => 'user_notifications'
  
  def self.list
    find(:all, :order => 'name')
  end
  
end
