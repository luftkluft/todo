class List < ApplicationRecord

  STATUS = {
    I18n.t('status.new') => :new,
    I18n.t('status.in_work') => :in_work,
    I18n.t('status.deferred') => :deferred,
    I18n.t('status.completed') => :completed
  }
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title_list, presence: true, length: { in: 1..500 }

  def self.status(s)
    @ss = s.to_s

    if @ss == 'all'
      @ss = 'all'
    elsif @ss == 'все'
      @ss = 'all'

    elsif @ss == 'new'
      @ss = 'new'
    elsif @ss == 'новые'
      @ss = 'new'

    elsif @ss == 'inwork'
      @ss = 'in_work'
    elsif @ss == 'вработе'
      @ss = 'in_work'

    elsif @ss == 'deferred'
      @ss = 'deferred'
    elsif @ss == 'отложенные'
      @ss = 'deferred'

    elsif @ss == 'completed'
      @ss = 'completed'
    elsif @ss == 'завершённые'
      @ss = 'completed'

    else
      @ss = 'all'
    end
  end

  def self.lists(l)
    @lt = l.to_s
    
    if @lt == 'newontop'
      @lt = 'created_at DESC'
    elsif @lt == 'новыесверху'
      @lt = 'created_at DESC'

    elsif @lt == 'oldontop'
      @lt = 'created_at ASC'
    elsif @lt == 'старыесверху'
      @lt = 'created_at ASC'

    elsif @lt == 'bypriority'
      @lt = 'priority_list DESC'
    elsif @lt == 'поприоритету'
      @lt = 'priority_list DESC'

    elsif @lt == 'byname'
      @lt = 'title_list ASC'
    elsif @lt == 'поимени'
      @lt = 'title_list ASC'

    elsif @lt == 'bydeadline'
      @lt = 'deadline_list ASC'
    elsif @lt == 'подедлайну'
      @lt = 'deadline_list ASC'

    else
      @lt = 'created_at ASC'
    end
  end

  def self.tasks(t)
    @tk = t.to_s

    if @tk == 'newontop'
      @tk = 'created_at DESC'
    elsif @tk == 'новыесверху'
      @tk = 'created_at DESC'

    elsif @tk == 'oldontop'
      @tk = 'created_at ASC'
    elsif @tk == 'старыесверху'
      @tk = 'created_at ASC'

    elsif @tk == 'bypriority'
      @tk = 'priority_task DESC'
    elsif @tk == 'поприоритету'
      @tk = 'priority_task DESC'

    elsif @tk == 'byname'
      @tk = 'content_task ASC'
    elsif @tk == 'поимени'
      @tk = 'content_task ASC'

    elsif @tk == 'bydeadline'
      @tk = 'deadline_task ASC'
    elsif @tk == 'подедлайну'
      @tk = 'deadline_task ASC'

    else
      @tk = 'created_at ASC'
    end
  end

  def self.sortlists
    begin
      if @ss == 'all'
        @lists = List.find_by_sql("SELECT * FROM lists 
                                   ORDER BY #{@lt};")
      else
        @lists = List.find_by_sql("SELECT * FROM lists WHERE status = '#{@ss}'
                                   ORDER BY #{@lt};")
      end

    rescue
      puts "sorting_list_error"
      I18n.t('sorting.error')
    end
  end

  def self.sorttasks
    begin
      #@tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY #{@tk}, status DESC;")
      @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY status DESC, #{@tk};")
    rescue
      puts "sorting_task_error"
      I18n.t('sorting.error')
    end
  end

end
