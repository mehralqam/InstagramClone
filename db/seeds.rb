# frozen_string_literal: true

User.destroy_all
user1 = User.new(
  user_name: 'Mehral Qamar',
  email: 'mehral.qamar@devsinc.com',
  password: '123456',
  password_confirmation: '123456',
  account_type: 'public'
)
user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')), filename: 'cat.jpg')
user1.skip_confirmation!
user1.save!

user2 = User.new(
  user_name: 'Mehru',
  email: 'mehralqamar6@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  account_type: 'private'
)
user2.avatar.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')), filename: 'cat.jpg')
user2.skip_confirmation!
user2.save!

Rails.logger.debug '3 Users created successfully!'

user1.followships.create!([
                            { user_id: user1.id, follower_id: user2.id }
                          ])
Rails.logger.debug 'followship created successfully!'
