class CreateActivityInfs < ActiveRecord::Migration
  def change
    create_table :activity_infs do |t|
      t.string :activity_id
      t.string :bid_num
      t.string :sign_up_num

      t.timestamps
    end
  end
end
