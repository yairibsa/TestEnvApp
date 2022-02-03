class UserController < ApplicationController
  def index
    @user = Message.all
  end
  
  def new
    @user = Message.new
  end
  
  def new
      @user = Message.new
       # 1.times { @messages.users.build }
  end  
  
  def create
      @user = User.new(params.require(:user).permit(users_attributes: [:name]))

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: "You user is now live." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end
    
  def edit
       @user = Message.find(params[:id])
  end  
  
  def update
        @user = Message.find(params[:id])
        
        respond_to do |format|
          if @user.update(params.require(:message).permit(:body, :active))
            format.html { redirect_to messages_path, notice: "The record was successfully updated." }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
  end
  
    
  def show
      @user = Message.find(params[:id])
  end
  
  def destroy
      # Perform the lookup
      @user = Message.find(params[:id])
       
       # Destroy/Delete the record
      @user.destroy
      
      # Redirect
      respond_to do |format|
        format.html { redirect_to messages_url, notice: "The record was removed." }
     
      end
  end

end
