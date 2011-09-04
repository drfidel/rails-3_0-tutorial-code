class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  def index
    @message = Message.new
    @messages = Message.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to(messages_path, :notice => 'Message was successfully created.') }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        @messages = Message.order("created_at DESC")
        format.html { render :action => "index" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

end
