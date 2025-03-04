class TasksController < ApplicationController
  def createtasks
    puts Task.create(title: 'Laundry', details: 'Do not mix colors!')
    puts Task.create(title: 'Studying', details: 'A lot of flashcards to do', completed: true)
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) # return task based on id
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
     # localhost:3000/task/11
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
     # localhost:3000/task/11
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_path(@task), status: :see_other
     # localhost:3000/tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
