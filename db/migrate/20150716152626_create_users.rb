class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :password_digest, null: false
      t.integer :karma, default: 1

      t.timestamps null: false
    end
  end
end
