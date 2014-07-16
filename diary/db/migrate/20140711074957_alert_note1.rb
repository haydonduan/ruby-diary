class AlertNote1 < ActiveRecord::Migration
  def up
			change_column("notes","title",:length => 20,:null => false, :default => 'tt')
  end

  def down
  end
end
