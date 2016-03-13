class SampleDataToCreate < ActiveRecord::Migration
  Category.create(name: "Food")
  Category.create(name: "Medical")
  Category.create(name: "Bike Services")

  SubCategory.create(name: "Beverages",category_id: 1)
  SubCategory.create(name: "Eat",category_id: 2)
  SubCategory.create(name: "First Aid",category_id: 3)

	Store.create(store_name:"Omar restaurent",open_time: "22:00",close_time: "04:00",store_owner: "Omar",phone_no: 987654,sub_category_id:2,category_id:1)
	Store.create(store_name:"Omar Booze",open_time: "22:00",close_time: "04:00",store_owner: "Omar",phone_no: 98765,sub_category_id:1,category_id:1)
	Store.create(store_name:"Javaji clinic",open_time: "22:00",close_time: "04:00",store_owner: "Omar",phone_no: 9876542,sub_category_id:3,category_id:2)

  Location.create(latitude: 12.9317,longitude:77.6227,store_id:1)
  Location.create(latitude: 12.9317,longitude:77.6327,store_id:1)
  Location.create(latitude: 12.9517,longitude:77.6327,store_id:2)
  Location.create(latitude: 12.0517,longitude:77.6327,store_id:3)
end
