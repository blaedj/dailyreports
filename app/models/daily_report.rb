class DailyReport < ActiveRecord::Base

  validates :date_recieved, :content, :date, :employee_id, presence: true


end
