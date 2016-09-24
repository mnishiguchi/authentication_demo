class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string     :email
      t.string     :password_digest
      t.references :registrable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
