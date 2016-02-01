require 'faker'

admin = User.create!(email: "admin@admin.com", password: "secret", role: "admin")

4.times do
  Page.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(2),
              draft: true
  )
  Page.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(1),
              draft: false
  )
end

12.times do
  BlogPost.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(2),
              draft: true,
              user: admin
  )
  BlogPost.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(1),
              draft: false,
              user: admin
  )
end

pages = Page.all
blog_posts = BlogPost.all

puts "A default admin was created with email: #{admin.email} and password: #{admin.password}"
puts "#{pages.count} Pages were created"
puts "#{blog_posts.count} Blog Posts were created"
