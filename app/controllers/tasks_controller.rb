class TasksController < ApplicationController

  def new
    @task = Task.new
  end
  
  def index
    @tasks = Task.all
  end
  
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = "編集が完了しました"
      redirect_to @task
    else
      flash.now[:danger] = "編集に完了できませんでした"
      render :edit      
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
  end

  private
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
