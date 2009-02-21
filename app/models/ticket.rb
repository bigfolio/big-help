class Ticket < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :user
  has_many :messages
  
  acts_as_state_machine :initial => :fresh
  state :fresh
  state :researching
  state :active
  state :closed
  
  before_create :generate_key
  after_create  :send_alerts

  event :research do 
      transitions :from => :fresh, :to => :researching
  end
  
  def classes
    klass = self.urgent ? self.state + ' urgent' : self.state
  end
  
  
  protected
  
  def send_alerts
    users = User.find(:all)
    users.each { |u| TicketMailer.deliver_ticket_alert(u, self) if u.categories.include?(self.category) }
    
    TicketMailer.deliver_ticket_confirmation(self)
    
  end
  
  def generate_key
    if (temp_key = random_key) and self.class.find_by_key(temp_key).nil?
      self.key = temp_key
    else
      generate_key
    end
  end
  
  def random_key
    characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
    temp_key = ''
    srand
    8.times do
      pos = rand(characters.length)
      temp_key += characters[pos..pos]
    end
    temp_key.upcase
  end
  
end
