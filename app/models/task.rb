class Task < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :project
  validates :name, presence: true
  validates_inclusion_of :priority, in: 1..3

  def get_deadline
    return nil if deadline==nil
    unless done
      days = (deadline - DateTime.now.to_date).to_i
      if days > 0
         return distance_of_time_in_words( DateTime.now.to_date, deadline) + ' remain'
      else
        return 'deadline is over!'
      end
    end
  end
end
