FactoryGirl.define do

  factory :employee do
    sequence(:name) { |n| "employee#{n}" }
    sequence(:email) { |n| "employee#{n}@example.com" }
    factory :active_employee do
      active true
    end

    factory :inactive_employee do
      active false
    end

  end

  factory :daily_report do
    date_recieved DateTime.now
    content "this is the daily report content"
    date Date.today
    sequence(:employee_id) { |n| 0+n }
  end

  # factory :report do
  #   start_date Date.new(2014, 6, 1)
  #   end_date Date.new(2014, 6, 7)
  # end

end
