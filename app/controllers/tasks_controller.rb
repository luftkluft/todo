class TasksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user_locale
  before_action :setup_current_user_locale, only: %i[new edit]
  before_action :owner, only: %i[edit update destroy]
  before_action :set_task, only: %i[show edit update destroy]
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
    @list.tasks.new(task_params).save
    if task_params[:content_task] == ''
      redirect_to root_path, notice: t('task.empty')
    else
      redirect_to root_path, notice: t('task.created')
    end
  rescue StandardError
    redirect_to root_path, notice: t('task.no_created')
  end

  def update
    respond_to do |format|
      if @task.update(update_params)
        format.html { redirect_to root_path, notice: t('task.updated') }
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
    @user = User.find(current_user.id)
    @list = @user.lists.find(task_params[:list_id])
  rescue StandardError
    redirect_to root_path, notice: t('info_list.error_list')
  end

  def set_user_locale
    user = User.find(current_user.id)
    I18n.locale = user.locale
  rescue StandardError
    locale = params[:locale]
    I18n.locale = locale
  end

  def task_id
    params.require(:id).to_s
  end

  def owner
    @tid = task_id
    current_user.lists.each do |list|
      list.tasks.each do |task|
        @task = task if task.id.to_s == @tid
      end
    end
    redirect_to root_path, notice: t('info_task.go_pass') if @task.nil?
  rescue StandardError
    redirect_to root_path, notice: t('info_task.go_pass')
  end

  def setup_current_user_locale
    User.find(current_user.id).update_attribute(:locale, I18n.locale) if current_user.locale.blank?
  rescue StandardError
    print "raise 'setup_user_locale'_error"
  end
end
