$LOAD_PATH << '.'

require 'webrick'
require 'IpckeyRestModule'
 
include WEBrick
 
def start_webrick(config = {})
  config.update(:Port => 9955)     
  server = HTTPServer.new(config)
  yield server if block_given?
  ['INT', 'TERM'].each {|signal| 
    trap(signal) {server.shutdown}
  }
  server.start
  print "server start"

end

start_webrick { | server |
  server.mount('/IPCKEY', IpckeyServlet)
}

