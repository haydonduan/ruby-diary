class AlertNote < ActiveRecord::Migration
  def up
			add_column("notes","content",:string,:size => 100)
  end

  def down
  end
end
