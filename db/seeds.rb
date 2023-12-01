# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user1 = User.create(username: "Wali", email:'wali@gmail.com',password_digest:12345678 )
user2 = User.create(username: "Fatima", email:'fatima@gmail.com',password_digest:12345678 )

item = Item.create(
  name: 'Second Spa session',
  description: 'th is the second spa session',
  deposit: 1,
  spa_session_fee: 1000,
  registration_fee: 300,
  total_amount_payable: 300,
  duration: 1
)
item.image.attach(io: File.open(Rails.root.join('app/assets/images/img.jpg')), filename: 'img.jpg', content_type: 'image/jpg')