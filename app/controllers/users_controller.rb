class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    def new
        if logged_in?
            redirect_to tasks_path, notice: "既にログインしています！"
        else
            @user = User.new
        end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = '会員登録が完了しました！'
            session[:user_id] = @user.id
            redirect_to tasks_path
        else
            render'new'
        end
    end
    
    def show
    end

    def edit
        if @user.email == current_user.email
        else
            redirect_to tasks_path, notice: "他のユーザーのプロフィールは編集できません！"
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(current_user.id), notice: "プロフィール画像を編集しました！"
        else
            render 'edit'
        end
    end

    private

    def user_params
        if current_user.nil? then
            params.require(:user).permit(:name, :email, :password, :password_confirmation )
        elsif current_user.admin == true then
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin )
        end
    end

    def set_user
        @user = User.find(params[:id])
    end
end
