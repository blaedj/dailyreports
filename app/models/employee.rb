class Employee < ActiveRecord::Base
  has_many :daily_reports

  validates :name, presence: true


  def reports_for_range(range)
    daily_reports.where('date >= ? and date <= ?', range.begin, range.end )
  end

  def report_for_date(some_date)
    daily_reports.where('date = ?', some_date).first
  end

  def recieved_for?(some_date)
    daily_reports.any? { |daily| daily.date == some_date }
  end

  def active?
    active
  end

end
