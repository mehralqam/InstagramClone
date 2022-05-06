ThinkingSphinx::Index.define :user, :with => :real_time do
  # fields
  indexes user_name, :sortable => true
end
