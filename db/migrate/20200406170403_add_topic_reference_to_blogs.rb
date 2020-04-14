class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :topic, foreign_key: true
    #to avoid topic must exist error while creating a new blog
    #add_column :blogs, :topic_id, :integer
  end
end
