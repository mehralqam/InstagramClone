class StoryCleanupJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Story.old.destroy_all
  end
end
