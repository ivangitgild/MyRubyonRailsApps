class CreateFuckforms < ActiveRecord::Migration
  def change
    create_table :fuckforms do |t|

      t.timestamps
    end
  end
end
