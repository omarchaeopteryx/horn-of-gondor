class CreateHornblowers < ActiveRecord::Migration[5.0]
  def change
    create_table :hornblowers do |t|

      t.timestamps
    end
  end
end
