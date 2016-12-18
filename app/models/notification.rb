class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  
  def read_change(read)
    if read
      '既読'  
    elsif
      '未読'
    end
  end
end
