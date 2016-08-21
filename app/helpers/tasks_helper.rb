module TasksHelper
   def get_deadline(task)
    return nil if task.deadline==nil
    if task.done
      return 'done!'
    elsif (task.deadline - DateTime.now.to_date).to_i > 0
      return time_ago_in_words(task.deadline) + ' remain'
    else
      return 'deadline is over!'
    end
  end
end
