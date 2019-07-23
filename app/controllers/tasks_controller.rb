class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  PER = 20
  def index
    @tasks = current_user.tasks.page(params[:page]).per(PER)
    if params[:status].present?
      @tasks = @tasks.search_status(params[:status])
    end
    if params[:title].present?
      @tasks =  @tasks.search_title(params[:title])
    end

    if params[:sort_expired].present?
      @tasks = @tasks.order(deadline: "DESC")
    end
    if params[:sort_priority].present?
      @tasks = @tasks.order(priority: "ASC")
    end

    @tasks = @tasks.order(id: "DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render 'edit'
    end
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end  

  def set_task
    @task = Task.find(params[:id])
  end

  def require_login
    unless logged_in?
        redirect_to new_session_path, notice:"ログインしてください"
    end
  end
end
