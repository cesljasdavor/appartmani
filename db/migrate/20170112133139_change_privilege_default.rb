class ChangePrivilegeDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :privilege, 0
  end
end
