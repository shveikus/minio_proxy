#\-s thin -o 0.0.0.0 -p 9393 -O Threads=0:16 -O Verbose
require './config/environment'
run MinioProxy::ApplicationController
