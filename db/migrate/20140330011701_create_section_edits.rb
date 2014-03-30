class CreateSectionEdits < ActiveRecord::Migration
  def change
    create_table :section_edits do |t|
    	t.references :admin_user
		t.references :section
		t.string "summery "
      	t.timestamps
    end
       add_index :section_edits, [:admin_user_id, :section_id], :unique => true, :name => 'by_admin_user_section'
  end
end
