class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :tasks, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :tasks
end
