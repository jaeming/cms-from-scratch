require 'faker'

4.times do 
  Page.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(2),
              published: true
  )
  Page.create(
              title: Faker::Name.title,
              body: Faker::Hipster.paragraph(1),
              published: false
  )
end

pages = Page.all
admin = User.create!(email: "admin@admin.com", password: "secret", role: "admin")
puts "A default admin was created with email: #{admin.email} and password: #{admin.password}"
puts "#{pages.count} Pages were created"
