class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :content
      t.integer :option_type, default: 0

      t.belongs_to :question

      t.timestamps
    end
  end
end
