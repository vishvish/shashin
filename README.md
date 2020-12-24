# Shashin

Organizing 18 years of photographs has several challenges and file management is only one of them.

Moving files around in an ordered way is hard without Lightroom or Capture One. Lightroom CC is a backward step for those of us who want or need to store our files locally.

I need to move files into a straightforward folder structure based on date.

I need the files to be renamed by their date and other metadata.

I need the files' metadata to contain correct and useful information such as their original filename.

I need reports that tell me about pictures per day, month and year. 

I need reports on possible missing pictures over time.

I need files to be checked for corruption.

I need to filter out TIFFs, JPGs, PSDs into separate folders for handling.

---

### Getting workflows of jobs working with ActiveJob

Clone the repo and install the deps:

    bundle

Run Redis on the default port, 6379. You could run the docker container:

    docker run --name shashin-redis -p 6379:6379 -d redis

#### Open some terminal panes.

Run the app in one:

    rails s

Run some Resque workers in another:

    COUNT=2 QUEUE=gush rake resque:workers

Tail the development log in another:

    tail -f log/development.log

And trigger a workflow in another:

    rake workflow