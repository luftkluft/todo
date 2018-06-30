class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_locale
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :owner, only: [:edit, :update, :destroy, :set_list]
  before_action :task_owner, only: [:complete]
  def index
    #@lists = current_user.lists
    #@lists = List.all
    redirect_to '/sorting'
    #render layout: false 
  end

  def sorting
    List.status(params[:status])
    List.lists(params[:lists])
    List.tasks(params[:tasks])
    @lists = List.sortlists
    @tasks = List.sorttasks
    format_sorting
  end

  def show
    render layout: false 
  end

  def new
    @list = List.new
    render layout: false 
  end

  def edit
    render layout: false 
  end

  def create
    new_list
    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: I18n.t('info_list.created') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_path, notice: I18n.t('info_list.updated') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: I18n.t('info_list.destroyed') }
    end
  end

  def complete
    @task.update_attribute(:status, "completed") 
    redirect_to root_path, notice: I18n.t('task.completed')
  end

  private

    def new_list
      begin
        @p = {"user_id" => current_user.id, "status" => "new"}
        @p.update(new_list_params)
        @list = List.new(@p)
      rescue
        redirect_to root_path, notice: I18n.t('info_list.no_list')
      end
    end

    def set_list
      begin
        @list = List.find(list_id)
      rescue
        redirect_to root_path, notice: I18n.t('info_list.no_list')
      end
    end

    def set_task
      params.require(:id).to_s
    end

    def list_params
      params.require(:list).permit( :title_list, :priority_list, :deadline_list, :status)
    end

    def new_list_params
      params.require(:list).permit( :title_list, :priority_list, :deadline_list)
    end

    def set_user_locale
      begin
        user = User.find(current_user.id)
        I18n.locale = user.locale
      rescue
        locale = params[:locale]
        if locale == ''
          I18n.locale = 'en'
        end
      end
    end

    def owner
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_path, notice: t('info_list.go_pass') if @list.nil?
    end

    def list_id
      params.require(:id).to_s
    end

    def task_id
      params.require(:id).to_s
    end

    def task_owner
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

    def format_sorting
      respond_to do |format|
        format.html { render layout: false, notice: I18n.t('sorting.up') }
      end
    end

end
