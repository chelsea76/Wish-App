class CreateMyWishes < ActiveRecord::Migration
  def change
    create_table :my_wishes do |t|
      t.string :title
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
