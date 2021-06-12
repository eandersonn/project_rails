class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
