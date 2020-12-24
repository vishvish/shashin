class FetchRaw < Gush::Job

  def perform
    # do some fetching from remote APIs
    # Rails.logger.debug "Fetch Raw image with params: #{params}"
    output("Fetch Raw image with params: #{params}")
  end
end