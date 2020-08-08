class AddPostIdToPostViews < ActiveRecord::Migration[6.0]
  def change
    add_reference :post_views, :post, null: false, foreign_key: true
  end
end
