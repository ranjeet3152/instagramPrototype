class CreateImage < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
			t.string :path
			t.text :caption
			t.integer :security
			t.integer :user_id
			t.timestamps
    end
  end
end
