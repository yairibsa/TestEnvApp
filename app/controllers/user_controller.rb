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
    
  def show
      @user = User.find(params[:id])
  end

end
