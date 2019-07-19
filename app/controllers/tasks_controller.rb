class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 3
  def index
    #binding.pry
    # if params[:status].present? && params[:title].present?
    #   @tasks = Task.search_status(params[:status]).search_title(params[:title])
    # elsif params[:status].blank? && params[:title].present? then 
    #   @tasks = Task.search_title(params[:title])
    # elsif params[:status].present? && params[:title].blank? then
    #   @tasks = Task.search_status(params[:status])
    # else
    #   @tasks = Task.all
    # end

    @tasks = Task.page(params[:page]).per(PER)
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
    @task = Task.new(task_params)
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
    @task = Task.new(task_params)
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
end
