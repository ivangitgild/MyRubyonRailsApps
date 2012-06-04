class CreateAdminusers < ActiveRecord::Migration
  def change
    create_table :adminusers do |t|
      t.string :username
      t.string :email
      t.string :fullname
      t.string :address
      t.integer :age

      t.timestamps
    end
  end
end
