class TasksController < ApplicationController
  before_action :set_user_locale
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owner, only: [:edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:create]

  def index
    @tasks = Task.all
  end

  def show
    render layout: false
  end

  def new
    @task = Task.new
    render layout: false
  end

  def edit
    render layout: false
  end

  def create
    begin
      @list.tasks.new(task_params).save
      redirect_to root_path, notice: t('task.created')
    rescue
      redirect_to root_path, notice: t('task.no_created')
    end
  end

  def update
    respond_to do |format|
      if @task.update(update_params)
        format.html { redirect_to root_path, notice:  t('task.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: t('task.destroyed') }
    end
  end

  private

    def task_params
      params.require(:task).permit(:list_id, :content_task, :priority_task, :deadline_task, :status)
    end

    def update_params
      params.require(:task).permit(:content_task, :priority_task, :deadline_task, :status)
    end

    def set_task
      owner
    end

    def set_list
      begin
        @user = User.find(current_user.id)
        @list = @user.lists.find(task_params[:list_id])
      rescue
        redirect_to root_path, notice: t('info_list.error_list')
      end
    end

    def set_user_locale
      begin
        user = User.find(current_user.id)
        I18n.locale = user.locale
      rescue
        locale = params[:locale]
        I18n.locale = locale
      end
    end

    def task_id
      params.require(:id).to_s
    end

    def owner
      begin
        @tid = task_id
        current_user.lists.each do |list|
          list.tasks.each do |task|
            if (task.id.to_s == @tid)
              @task = task
            end
          end
        end
        redirect_to root_path, notice: t('info_task.go_pass') if @task.nil?
      rescue
        redirect_to root_path, notice: t('info_task.go_pass')
      end
    end
end
