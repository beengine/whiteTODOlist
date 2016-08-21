class Task < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name, :project, :priority
  validates_inclusion_of :priority, in: 1..3
end
