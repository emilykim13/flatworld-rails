class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :element_id
      t.string :ordinal_name
      t.string :type_one
      t.string :title
      t.string :ordinal

      t.timestamps
    end
  end
end
