class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :deposit
      t.decimal :spa_session_fee
      t.decimal :registration_fee
      t.decimal :total_amount_payable
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
