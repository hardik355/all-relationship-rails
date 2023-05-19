class CreatePanCards < ActiveRecord::Migration[7.0]
  def change
    create_table :pan_cards do |t|
      t.bigint :pan_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
