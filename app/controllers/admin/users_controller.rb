class Admin::UsersController < Admin::BaseController

  def index
    #use this to display all of the users in a table
    @users = User.all
  end

  #change status of users from admin to non-admin
  def update
    @user = User.find(params[:id])
    #use rails ajax
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: "User Updated" }
        format.js { render :update_success }
      else 
        format.html { redirect_to admin_users_path, alert: "User Not Updated" }
        format.js { render :update_failure }
      end
    end
  end

  #use this to delete a user 
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #use rails ajax
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice:"User Deleted" }
      format.js { render }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_admin)
  end



end
