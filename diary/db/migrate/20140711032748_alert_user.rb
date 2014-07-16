class AlertUser < ActiveRecord::Migration
  def up
			add_column("notes","birthday",:timestamp)
  end

  def down
  end
end
