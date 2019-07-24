class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    # before_action :admin_user

    def index
      @users = User.select(:id, :name, :email, :created_at).order("created_at DESC")
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = '会員登録が完了しました！（管理画面経由）'
            redirect_to admin_users_path
        else
            render'new'
        end
    end
    
    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to admin_users_path, notice: "編集しました！"
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        redirect_to admin_users_path, notice:"タスクを削除しました！"
      end
  
    private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def set_user
        @user = User.find(params[:id])
    end
end