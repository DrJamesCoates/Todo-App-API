class AddDateColumnToTodosTable < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :deadline, :date
  end
end
