class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :article

  before_destroy do
    @tag = self.tag
  end

  private
  
  after_destroy do
    if @tag.taggings.count == 0  
      @tag.destroy
    end
  end
end