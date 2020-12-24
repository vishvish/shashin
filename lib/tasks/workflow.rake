desc "Create workflow"
task :workflow => :environment do
  flow = IngestWorkflow.create({image_basename: "L12344", raw: true, jpeg: true, sidecar: true})
  flow.start!
end