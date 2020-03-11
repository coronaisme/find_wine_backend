# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(name:"nick", password_digest:"password", age:28, email:"email@email.com", city:"city", state:"state", address:"address", zipcode:12345)
u2 = User.create(name:"rick", password_digest:"password", age:28, email:"email@email.com", city:"city", state:"state", address:"address", zipcode:12345)

o1 = Order.create(status: "Delivered", user_id:1, order_date: "date", shipped_to:"address")
o2 = Order.create(status: "Not Delivered", user_id:2, order_date:"date", shipped_to:"none")

w1 = Wine.create(title:"wine1", year:1997, varietal:"Cab", origin:"france", description:"description", score:99, order_id:1)
w1 = Wine.create(title:"wine2", year:1992, varietal:"Zin", origin:"Australia", description:"description", score:99, order_id:2)

r1 = Review.create(content:"content1", wine_id:1, rating:4, user_id:2)
r2 = Review.create(content:"content2", wine_id:2, rating:5, user_id:1)