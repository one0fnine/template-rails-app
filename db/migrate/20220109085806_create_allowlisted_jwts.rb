class CreateAllowlistedJwts < ActiveRecord::Migration[7.0]
  def change
    create_table :allowlisted_jwts, id: :uuid do |t|
      t.string :jti, null: false
      t.string :aud
      # If you want to leverage the `aud` claim, add to it a `NOT NULL` constraint:
      # t.string :aud, null: false
      t.datetime :exp, null: false
      t.references :accounts, foreign_key: {on_delete: :cascade}, null: false, type: :uuid
    end
  end
end
