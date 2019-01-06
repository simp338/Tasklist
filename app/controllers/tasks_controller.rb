class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy, :edit, :show]

  def new
    @task = Task.new
  end
  
  def index
    @tasks = Task.all.page(params[:page])
  end
  
  def update

    if @task.update(task_params)
      flash[:success] = "編集が完了しました"
      redirect_to @task
    else
      flash.now[:danger] = "編集を完了できませんでした"
      render :edit      
    end
  end
  
  def destroy
    @task.destroy
    flash[:success] = "タスクを削除しました"
    redirect_to tasks_url
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクを登録しました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクを登録できませんでした"
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
