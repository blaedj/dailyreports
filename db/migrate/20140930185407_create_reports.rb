class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end
end
