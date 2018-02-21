class Article < ActiveRecord::Migration
  def change
  	    create_table :article do |t|
    	t.string "title"
    	t.string "date"
    	t.string "image"
      t.integer "user_id"
    	t.string "header"
    	t.string "body"    	
    	t.string "author"
   		end
  end
end
