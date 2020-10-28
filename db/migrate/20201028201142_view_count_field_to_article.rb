class ViewCountFieldToArticle < ActiveRecord::Migration[5.2]
  class AddPaperclipFieldsToArticle < ActiveRecord::Migration
    def change
      add_column :articles, :view_count,    :integer
    end
  end
end
