class Employee < ActiveRecord::Base
  has_many :daily_reports

  validates :name, presence: true

end
