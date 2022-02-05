class UserController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end  
  
  def create
      @user = User.new(params.require(:user).permit(:name, :password))
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
       @user = User.find(params[:id])
  end  
  
  def update
        @user = User.find(params[:id])
        
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
      @user = User.find(params[:id])
  end
  
  def destroy
      # Perform the lookup
      @user = User.find(params[:id])
       
       # Destroy/Delete the record
      @user.destroy
      
      # Redirect
      respond_to do |format|
        format.html { redirect_to user_url, notice: "The record was removed." }
     
      end
  end

end
