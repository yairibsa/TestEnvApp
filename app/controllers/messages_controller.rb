class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def user
    @user_messages = Message.user
  end
  
  def newuser
    @user = Message.newuser
  end
  
  def new
      @messages = Message.new
         
  end  
  
  def create
      @messages = Message.new(params.require(:message).permit(:body, :active, :user_id))

      respond_to do |format|
        if @messages.save
          format.html { redirect_to messages_path, notice: "You message is now live." }
          format.json { render :show, status: :created, location: @messages }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @messages.errors, status: :unprocessable_entity }
        end
      end
  end
    
  def edit
       @messages = Message.find(params[:id])
  end  
  
  def update
        @messages = Message.find(params[:id])
        
        respond_to do |format|
          if @messages.update(params.require(:message).permit(:body, :active))
            format.html { redirect_to messages_path, notice: "The record was successfully updated." }
            format.json { render :show, status: :ok, location: @messages }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @messages.errors, status: :unprocessable_entity }
          end
        end
  end
  
    
  def show
      @messages = Message.find(params[:id])
  end
  
  def destroy
      # Perform the lookup
      @messages = Message.find(params[:id])
       
       # Destroy/Delete the record
      @messages.destroy
      
      # Redirect
      respond_to do |format|
        format.html { redirect_to messages_url, notice: "The record was removed." }
     
      end
  end
end
