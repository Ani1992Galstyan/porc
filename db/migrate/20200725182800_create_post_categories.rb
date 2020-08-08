class CreatePostCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :post_categories do |t|
      t.bigint :post_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
