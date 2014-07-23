class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :message_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string :text

      t.timestamps
    end
  end
end
