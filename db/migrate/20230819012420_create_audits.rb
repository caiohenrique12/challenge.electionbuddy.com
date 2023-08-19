# frozen_string_literal: true

class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|
      t.integer :entity_id
      t.string :entity_name
      t.text :changed_data
      t.references :user, null: false, foreign_key: true
      t.datetime :changed_at

      t.timestamps
    end
  end
end
