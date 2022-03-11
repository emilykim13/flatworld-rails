class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :section_ordinal
      t.string :element_id
      t.string :ordinal_name
      t.string :type_one
      t.string :title
      t.integer :chapter_id

      t.timestamps
    end
  end
end
