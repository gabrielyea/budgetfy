class CreateJoinTableAvtivityGroup < ActiveRecord::Migration[6.1]
  def change
    create_join_table :activities, :groups do |t|
      t.index [:activity_id, :group_id]
      t.index [:group_id, :activity_id]
    end
  end
end
