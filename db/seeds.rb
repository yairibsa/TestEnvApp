# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    email: "test@email.com",
    password: "123456",
    password_confirmation: "123456",
    name: "Admin User",
    roles: "site_admin"
    )
puts "1 Admin user created"

User.create!(
    email: "test2@email.com",
    password: "123456",
    password_confirmation: "123456",
    name: "Regular User"
    )
puts "1 regular user created"

3.times do |topic|
    Topic.create!(
        title: "Topic #{topic}")
end

puts "3 Topics created"

10.times do |blog|
    Guide.create!(
        title:"My blog Post #{blog}",
        body: "By default, attribute names should be snakecase. 
        You should generate a migration which will change Product_id to product_id and migrate as to fix the error. 
        You should also change association names to snakecase as well. For instance",
        topic_id: Topic.last.id
        )
end 

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title:"Rails #{skill}",
        percent_utilized:15
        )
end

puts "5 skills created"

8.times do |portfolio_item|
    Portfolio.create!(
        title:"Portfolio title #{portfolio_item}" ,
        subtitle:"Ruby on rails" ,
        body:"By default, attribute names should be snakecase. 
        You should generate a migration which will change Product_id to product_id and migrate as to fix the error. 
        You should also change association names to snakecase as well. For instance" ,
        main_image:"https://via.placeholder.com/150",
        thumb_image:"https://via.placeholder.com/300"
        )
end

1.times do |portfolio_item|
    Portfolio.create!(
        title:"Portfolio title #{portfolio_item}" ,
        subtitle:"Angular" ,
        body:"By default, attribute names should be snakecase. 
        You should generate a migration which will change Product_id to product_id and migrate as to fix the error. 
        You should also change association names to snakecase as well. For instance" ,
        main_image:"https://via.placeholder.com/150",
        thumb_image:"https://via.placeholder.com/300"
        )
end

puts "9 portfolios items created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Technology #{technology}"
        )
    end
    
puts "3 technologies created"
