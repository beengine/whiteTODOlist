class Task < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name, :project, :priority
  validates_inclusion_of :priority, in: %w( low normal high )
  enum priority: [:low, :normal, :high]
end
