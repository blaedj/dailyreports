class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.dailyreports :has_many

      t.timestamps
    end
  end
end
