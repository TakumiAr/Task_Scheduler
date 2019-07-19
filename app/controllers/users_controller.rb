class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
        flash[:notice] = '会員登録が完了しました！'
        redirect_to new_user_path
        else
        render'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
