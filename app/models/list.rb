class List < ApplicationRecord
  STATUS = {
    I18n.t('status.new') => :new,
    I18n.t('status.in_work') => :in_work,
    I18n.t('status.deferred') => :deferred,
    I18n.t('status.completed') => :completed
  }.freeze
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title_list, presence: true

  def self.status(s)
    @ss = s.to_s

    @ss = if @ss == 'all'
            'all'
          elsif @ss == 'все'
            'all'

          elsif @ss == 'new'
            'new'
          elsif @ss == 'новые'
            'new'

          elsif @ss == 'inwork'
            'in_work'
          elsif @ss == 'вработе'
            'in_work'

          elsif @ss == 'deferred'
            'deferred'
          elsif @ss == 'отложенные'
            'deferred'

          elsif @ss == 'completed'
            'completed'
          elsif @ss == 'завершённые'
            'completed'

          else
            'all'
          end
  end

  def self.lists(l)
    @lt = l.to_s

    @lt = if @lt == 'newontop'
            'created_at DESC'
          elsif @lt == 'новыесверху'
            'created_at DESC'

          elsif @lt == 'oldontop'
            'created_at ASC'
          elsif @lt == 'старыесверху'
            'created_at ASC'

          elsif @lt == 'bypriority'
            'priority_list DESC'
          elsif @lt == 'поприоритету'
            'priority_list DESC'

          elsif @lt == 'byname'
            'title_list ASC'
          elsif @lt == 'поимени'
            'title_list ASC'

          elsif @lt == 'bydeadline'
            'deadline_list ASC'
          elsif @lt == 'подедлайну'
            'deadline_list ASC'

          else
            'created_at ASC'
          end
  end

  def self.tasks(t)
    @tk = t.to_s

    @tk = if @tk == 'newontop'
            'created_at DESC'
          elsif @tk == 'новыесверху'
            'created_at DESC'

          elsif @tk == 'oldontop'
            'created_at ASC'
          elsif @tk == 'старыесверху'
            'created_at ASC'

          elsif @tk == 'bypriority'
            'priority_task DESC'
          elsif @tk == 'поприоритету'
            'priority_task DESC'

          elsif @tk == 'byname'
            'content_task ASC'
          elsif @tk == 'поимени'
            'content_task ASC'

          elsif @tk == 'bydeadline'
            'deadline_task ASC'
          elsif @tk == 'подедлайну'
            'deadline_task ASC'

          else
            'created_at ASC'
          end
  end

  def self.sortlists
    @lists = if @ss == 'all'
               List.find_by_sql("SELECT * FROM lists
                                   ORDER BY #{@lt};")
             else
               List.find_by_sql("SELECT * FROM lists WHERE status = '#{@ss}'
                                   ORDER BY #{@lt};")
             end
  rescue StandardError
    puts 'sorting_list_error'
    I18n.t('sorting.error')
  end

  def self.sorttasks
    @tasks = Task.find_by_sql("SELECT * FROM tasks ORDER BY status DESC, #{@tk};")
  rescue StandardError
    puts 'sorting_task_error'
    I18n.t('sorting.error')
  end
end
