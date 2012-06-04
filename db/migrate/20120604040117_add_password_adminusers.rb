class AddPasswordAdminusers < ActiveRecord::Migration
  def up
	add_column :adminusers, :password, :string
  end

  def down
  end
end
