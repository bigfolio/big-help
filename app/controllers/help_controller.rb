class HelpController < ApplicationController
  
  def index
    
  end
  
  def contact
    
  end
  
  def faqs
    @faqs = Faq.find(:all, :conditions => ['category_id = ?', params[:id]])
    render :layout => false
  end
  
  def view_by_key
    @ticket = Ticket.find_by_key(params[:key])
    render :text => @ticket.subject
  end
  
  def search_by_key
    @ticket = Ticket.find_by_key(params[:key])
    redirect_to @ticket ? view_by_key_url(@ticket.key) : root_url
  end
  
  def search
    
  end
  
end
