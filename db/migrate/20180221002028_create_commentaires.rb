class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.string :pseudo
      t.integer :article_id
      t.string :body
      t.timestamps null: false
    end
  end
end
