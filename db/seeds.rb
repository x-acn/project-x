# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "Seeding database"
puts "-------------------------------"

## Create an initial Admin User ##
domain = Locomotive.config.domain
admin_email = "admin@#{domain}"
admin_pass  = 'password'

admin = Account.where(:email => admin_email).first
unless admin
  puts "Creating an initial admin user:"
  puts "-- email:    #{admin_email}"
  puts "-- password: #{admin_pass}"
  puts ""
  puts "Be sure to change these credentials ASAP!"
  admin = Account.create!({
    :name                   => 'Admin',
    :email                  => admin_email,
    :password               => admin_pass,
    :password_confirmation  => admin_pass
  })
end

## Creating Main Site ##
main = Site.where(:name => 'Main').first
unless main
  puts "Creating site Main @ main.#{domain}"
  
  main = Site.create!({
    :name => 'Main',
    :seo_title => 'Main',
    :meta_keywords => 'some meta keywords',
    :meta_description => 'some meta description',
    :subdomain => 'main',
    :domains => ["main.#{domain}"]
  })
end

## Assigning Admin to Main Site ##
unless admin.sites.find(main.id)
  main.memberships.build(:account => admin, :role => 'admin')
  main.save!
end



