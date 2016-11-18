class AddAppTypeToActivationCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :activation_codes, :app_type, :string, default: 'seventeen_days'
  end
end
