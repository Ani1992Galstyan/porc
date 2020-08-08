class CreatePostViews < ActiveRecord::Migration[6.0]
  def change
    create_table :post_views do |t|
      t.bigint :view_count

      t.timestamps
    end
  end
end
