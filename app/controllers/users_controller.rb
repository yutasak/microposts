class UsersController < ApplicationController
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
     @user = User.new
     
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

def edit
    @user = User.find(params[:id])
end
  
def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功したときの処理
    else
      render 'edit'
    end
end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :edit, :update, 
                                 :password_confirmation)
  end
end
