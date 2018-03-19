require 'webrick'
require 'json'

include WEBrick

class RefreshServlet < HTTPServlet::AbstractServlet
   @@time_ended = true
	
   def do_GET(req,resp)
	i = 1
	while @@time_ended 
 	   resp.body = "Loading ... #{i}" 
	   #getTime()
	   sleep(1)
	   i=i+1
           raise HTTPStatus::OK
	end
   end

    def getTime()
      time = Time.new
      sleep(5)
      @@time_ended = false
      return time.to_s
    end 
end

