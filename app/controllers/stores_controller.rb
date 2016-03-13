class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
  end
  def search
    if params[:q].present?
      categories = Category.search(params[:q]).records
      sub_categories = SubCategory.search(params[:q]).records
      stores = Store.search(params[:q]).records

      category_ids = categories.collect(&:id)
      subcategory_ids = sub_categories.collect(&:id)
      @stores = Store.where("category_id IN(?) or sub_category_id IN(?)",category_ids,subcategory_ids)
      @stores += stores
    else
      @stores = Store.all
    end 
    @hash=[]
    @stores.each do |store|
      store.locations.each do |location|
        @hash << {:lat=>location.latitude,:lng=>location.longitude,:title=>store.store_name,:infowindow=>store.store_name + " - " + store.description}
      end
    end
    Rails.logger.info  "=====hello#{@hash.count.inspect}"
    #@stores += Store.where(sub_category_id: subegory_ids)
    #raise @stores.inspect
  end
end
