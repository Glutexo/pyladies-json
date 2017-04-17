workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads 1, 1 # min and max threads

preload_app!

port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
