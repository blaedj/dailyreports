FactoryGirl.define do

  factory :employee do
    sequence(:name) { |n| "employee#{n}" }
  end

  factory :daily_report do
    date_recieved DateTime.now
    content "this is the daily report content"
    date DateTime.now
    employee_id 1
  end

end
