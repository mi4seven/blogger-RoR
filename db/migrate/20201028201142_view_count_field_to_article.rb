class ViewCountFieldToArticle < ActiveRecord::Migration[5.2]
    def change
      add_column :articles, :view_count, :integer
    end
end
