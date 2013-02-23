class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      #user personal info
      t.column :first_name,           :string,  :null => false
      t.column :last_name,            :string,  :null => false
      t.column :phone_number,         :string
      t.column :login,                :string,  :null => false, :limit => 20
      t.column :email,                :string,  :null => false, :limit => 100
      
      #authlogic and password related fields
      t.column :crypted_password,     :string,  :null => false
      t.column :password_salt,        :string,  :null => false
      t.column :persistence_token,    :string,  :null => false
      t.column :single_access_token,  :string,  :null => false
      t.column :perishable_token,     :string,  :null => false
      
      #session information
      t.column :login_count,          :integer, :null => false, :default => 0
      t.column :failed_login_count,   :integer, :null => false, :default => 0
      t.column :last_request_at,      :datetime
      t.column :current_login_at,     :datetime
      t.column :last_login_at,        :datetime
      t.column :current_login_ip,     :string
      t.column :last_login_ip,        :string
      
      #validation and other possible important times
      t.column :password_reset_at,    :datetime
      t.column :email_confimred_at,   :datetime
      t.column :tos_agreed_at,        :datetime
      
      #site and forum access level
      t.column :admin,                :boolean, :default => false
      t.column :moderator,            :boolean, :default => false
      t.column :event_coord,          :boolean, :default => false
      
      t.timestamps
    end
  
    add_index :users, :login, :unique => true
  end
  
  def down
    drop_table :users
  end
end