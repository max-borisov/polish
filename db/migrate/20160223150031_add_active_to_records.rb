class AddActiveToRecords < ActiveRecord::Migration
  def change
    add_column :records, :active, :boolean, default: false
  end
end
