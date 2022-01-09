# frozen_string_literal: true

class DeviseCreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      t.timestamps null: false
    end

    add_index :accounts, :email, unique: true
    add_index :accounts, :reset_password_token, unique: true
    add_index :accounts, :confirmation_token, unique: true
  end
end
