class Task < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  belongs_to :project

  def get_deadline
    unless done
      days = (deadline - DateTime.now.to_date).to_i
      puts days
      puts deadline.class
      puts DateTime.now.to_date.class
      if days > 0
         return distance_of_time_in_words( DateTime.now.to_date, deadline) + ' remain'
      else
        return 'deadline is over!'
      end
    end
  end
end
