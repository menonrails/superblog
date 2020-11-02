class AddUserRefToComments < ActiveRecord::Migration[6.0]
  def change
    # remove_reference :comments, :post
    remove_reference :posts, :comments
    add_reference :comments, :post, null: false, foreign_key: true
    # add_reference :posts, :comments, dependent: :destroy
  end
end
