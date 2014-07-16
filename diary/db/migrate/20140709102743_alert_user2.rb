class AlertUser2 < ActiveRecord::Migration
  def up
			change_column("users","sex",:boolean)
			add_column("note","author",:integer,:size => 10)
  end

  def down
  end
end
