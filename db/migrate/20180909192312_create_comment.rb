class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
			t.text :pic_comment
			t.integer :user_id
			t.integer :state
			t.timestamps
    end
  end
end
