class DailyReport < ActiveRecord::Base
  belongs_to :employee
  validates :date_recieved, :content, :date, :employee_id, presence: true


end
