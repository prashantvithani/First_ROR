class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def change
    create_table :admin_users_pages, :id => false do |t|
    	t.integer "admin_user_id"
    	t.integer "page_id"
    	# add_index :admin_user_id, :page_id
    end
    add_index :admin_users_pages, [:admin_user_id, :page_id], :unique => true, :name => 'by_admin_user_page'
  end
end
