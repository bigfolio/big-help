require 'chronic'
class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = Ticket.paginate :page => params[:page], :conditions => search_conditions, :order => 'created_at DESC'
    
    # @tickets = Ticket.find(:all, :conditions => search_conditions)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def research
    @ticket = Ticket.find(params[:id])
    @ticket.research!
    
    respond_to do |format|
      # format.html { redirect_to(tickets_url) }
      format.js
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        format.html { redirect_to(view_by_key_url(@ticket.key)) }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { redirect_to(@ticket) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
  
  def fresh
    @tickets = Ticket.find(:all, :conditions => "state = 'fresh' OR state = 'researching'")
  end
  
  protected
  
  def search_conditions
    cond_params = { 
      :q => "%#{params[:q]}%", 
      :start_on => Chronic.parse(params[:start_on]), 
      :end_on => Chronic.parse(params[:end_on])
    }
    
    cond_strings = returning([]) do |strings|
      strings << "(name like :q or email like :q or domain like :q or subject like :q or `key` like :q)" unless params[:q].blank?
      if cond_params[:start_on] && cond_params[:end_on]
        strings << "created_at between :start_on and :end_on"
      elsif cond_params[:start_on]
        strings << "created_at >= :start_on"
      elsif cond_params[:end_on]
        strings << "created_at <= :end_on"
      end
    end
    
    cond_strings.any? ? [ cond_strings.join(' and '), cond_params ] : nil
  end
  
  
end
