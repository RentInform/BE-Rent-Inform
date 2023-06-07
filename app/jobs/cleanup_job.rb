class CleanupJob < ApplicationJob
  queue_as :default

  def perform
    TempProperty.delete_all
  end
end