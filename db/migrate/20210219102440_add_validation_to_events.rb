class AddValidationToEvents < ActiveRecord::Migration[6.1]
  def change
  	add_column :events, :validated, :boolean, default: false
  end
end
