$LOAD_PATH << '.'

require 'webrick'
require 'IpckeyRestModule'
require 'PortRestModule'
require 'RefreshRestModule'

include WEBrick
 
def start_webrick(config = {})
  config.update(:Port => 50555)     
  server = HTTPServer.new(config)
  yield server if block_given?
  ['INT', 'TERM'].each {|signal| 
    trap(signal) {server.shutdown}
  }
  server.start

end

start_webrick { | server |
  server.mount('/IPCKEY', IpckeyServlet)
  server.mount('/PORT', PortServlet)
  server.mount('/REFRESH', RefreshServlet)
  server.mount_proc('/') {|req, res| res.body = "Hello #{req.query['name']}!" }  
}

