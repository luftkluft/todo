class Task < ApplicationRecord
  STATUS = {
    # I18n.t('status.new') => :new,
    I18n.t('status.in_work') => :in_work,
    # I18n.t('status.deferred') => :deferred,
    I18n.t('status.completed') => :completed
  }.freeze
  belongs_to :list

  validates :content_task, presence: true
end
