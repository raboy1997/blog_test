class CreateSubComments < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_comments do |t|
      t.string :body
      t.belongs_to :user
      t.belongs_to :comment

      t.timestamps
    end
  end
end
