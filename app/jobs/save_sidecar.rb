class SaveSidecar < Gush::Job

  def perform
    # do some fetching from remote APIs
    # Rails.logger.debug "Fetch Raw image with params: #{params}"
    output("Save Sidecar with params: #{params}")
  end
end