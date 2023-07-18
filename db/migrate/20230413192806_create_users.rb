class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.datetime :email_verified_at
      t.string :password
      t.string :token
      t.string :otp_code
      t.string :avatar
      t.boolean :verified
      t.boolean :blocked
      t.string :bio
      t.string :longitude
      t.string :latitude
      t.string :country
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
