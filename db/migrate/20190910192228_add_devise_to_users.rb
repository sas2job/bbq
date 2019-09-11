# Миграция сгенерирована девайзом при добавлении функционала:
#   rails g devise User
#
# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  # метод self.up - для накатывания миграции
  def self.up
    # меняем таблицу users
    change_table :users do |t|
      ## Database authenticatable
      # меняем таблицу email - новые ограничения
      t.change :email, :string, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  # self.down - для откатывания миграции
  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
