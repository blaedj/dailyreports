class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.datetime :date_recieved
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
