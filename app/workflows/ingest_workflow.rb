# app/workflows/ingest_workflow.rb
class IngestWorkflow < Gush::Workflow
  # pass in a hash of options
  def configure(options)
    # extract options
    image_basename = options["image_basename"]
    ingest_raw = options["raw"]
    ingest_jpeg = options["jpeg"]
    ingest_sidecar = options["sidecar"]

    # Let the jobs return false if not required or the file does not exist
    run FetchRaw, params: { ingest: ingest_raw, image: image_basename }
    run FetchJpeg, params: { ingest: ingest_jpeg, image: image_basename }
    run FetchSidecar, params: { ingest: ingest_sidecar, image: image_basename }

    # Save sidecar data
    run SaveSidecar, after: FetchSidecar

    # Save metadata from either file in db
    run ExtractMetadata,
        after: [FetchRaw, FetchJpeg],
        before: IndexForSearch

    # Inject information into Search storage, e.g. ElasticSearch
    run IndexForSearch
  end
end