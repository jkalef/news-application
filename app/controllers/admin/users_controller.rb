class Admin::UsersController < Admin::BaseController
  #we want to show users, update users, and delete users
  def index
    #use this to display all of the users in a table
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "User Updated"
    else 
      redirect_to admin_users_path, alert: "User Not Updated"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice:"User Deleted"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_admin)
  end



end
