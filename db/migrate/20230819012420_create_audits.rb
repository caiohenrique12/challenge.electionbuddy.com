class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.integer :object_id
      t.string :class_name
      t.text :changes
      t.references :user, null: false, foreign_key: true
      t.datetime :changed_at

      t.timestamps
    end
  end
end
