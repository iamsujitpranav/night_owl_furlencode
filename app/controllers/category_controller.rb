class CategoryController < ApplicationController
  
  def search
    #a = Elasticsearch::Model.search(params[:q], [Category, SubCategory,Store])
    categories = Category.search(params[:q]).records
    sub_categories = SubCategory.search(params[:q]).records
    stores = Store.search(params[:q]).records
    
    category_ids = categories.collect(&:id)
    subcategory_ids = sub_categories.collect(&:id)
    @stores = Store.where("category_id IN(?) or sub_category_id IN(?)",category_ids,subcategory_ids)
    @stores << stores
    #@stores += Store.where(sub_category_id: subegory_ids)
    #raise @stores.inspect
    
    
  end
end
