class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.timestamps
    end
    create_join_table :posts, :comments do |t|
      t.index :post_id
      t.index :comment_id
    end
  end
end
