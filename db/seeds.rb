# frozen_string_literal: true

User.destroy_all
user1 = User.new(
  user_name: 'Mehral Qamar',
  email: 'mehral.qamar@devsinc.com',
  password: 'mehral',
  password_confirmation: 'mehral',
  account_type: 0
)
user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')), filename: 'cat.jpg')
user1.skip_confirmation!
user1.save!

user2 = User.new(
  user_name: 'Mehru',
  email: 'mehralqamar6@gmail.com',
  password: 'mehral',
  password_confirmation: 'mehral',
  account_type: 1
)
user2.avatar.attach(io: File.open(Rails.root.join('app/assets/images/heart.jpg')), filename: 'heart.jpg')
user2.skip_confirmation!
user2.save!

Rails.logger.debug '3 Users created successfully!'

user1.followships.create!([
                            { user_id: user1.id, follower_id: user2.id }
                          ])
Rails.logger.debug 'followship created successfully!'
post1 = user1.posts.create!(
  user_id: user1.id,
  caption: 'pink flower'
)
post1.images.attach(
  io: File.open(Rails.root.join('app/assets/images/heart.jpg')),
  filename: 'cat.jpg',
  content_type: 'image/png'
)
post1.likes.new(
  post_id: post1.id,
  user_id: user1.id
)
post1.comments.new(
  post_id: post1.id,
  user_id: user1.id,
  description: 'new pic of a cute cat'
)
post1.save!

story1 = user2.stories.new(
  user_id: user2.id
)
story1.image.attach(io: File.open(Rails.root.join('app/assets/images/cat.jpg')), filename: 'heart.jpg')
story1.save!
