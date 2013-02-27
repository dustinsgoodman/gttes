class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      #user personal info
      t.string   :first_name,          :string,  :null => false
      t.string   :last_name,           :string,  :null => false
      t.string   :phone_number,        :string
      t.string   :login,               :string,  :null => false, :limit => 20
      t.string   :email,               :string,  :null => false, :limit => 100
      
      #authlogic and password related fields
      t.string   :crypted_password,    :string,  :null => false
      t.string   :password_salt,       :string,  :null => false
      t.string   :persistence_token,   :string,  :null => false
      t.string   :single_access_token, :string,  :null => false
      t.string   :perishable_token,    :string,  :null => false
      
      #session information
      t.integer  :login_count,         :integer, :null => false, :default => 0
      t.integer  :failed_login_count,  :integer, :null => false, :default => 0
      t.datetime :last_request_at,     :datetime
      t.datetime :current_login_at,    :datetime
      t.datetime :last_login_at,       :datetime
      t.string   :current_login_ip,    :string
      t.string   :last_login_ip,       :string
      
      #validation and other possible important times
      t.datetime :password_reset_at,   :datetime
      t.datetime :email_confimred_at,  :datetime
      t.datetime :tos_agreed_at,       :datetime
      
      #site and forum access level
      t.boolean  :admin,               :boolean, :default => false
      t.boolean  :moderator,           :boolean, :default => false
      t.boolean  :event_coord,         :boolean, :default => false
      
      t.timestamps
    end
  
    add_index :users, :login, :unique => true
  end
  
  def down
    drop_table :users
  end
end