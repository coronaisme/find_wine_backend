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

r1 = Review.create(content:"content1", wine_id:1, rating:4, user_id:2)
r2 = Review.create(content:"content2", wine_id:2, rating:5, user_id:1)

#wines

Wine.create(title: "Screaming Eagle", year: 2014, varietal: "Cabernet Sauvignon", description: "Extremely perfumed with blackberries, currants and flower. Rose petals, too. Seductive. Medium to full body. It grows on the palate with an extremely long finish that goes on for minutes. The tannins are ultra-fine and polished. Purity and essence to this. Feminine yet wild and unpredictable. Available in March. Better in 2021.", score: 95, price: 3000, country: "USA", region: "Napa Valley, CA")