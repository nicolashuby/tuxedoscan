require 'webrick'
require 'json'

include WEBrick

class RefreshServlet < HTTPServlet::AbstractServlet
   def do_GET(req,resp)
	#resp['Content-Type'] = 'application/json'
	time = getTime()
        puts "Time from do_GET #{time}" 
	resp.body = time.to_s
        raise HTTPStatus::OK
   end

    def getTime()
      time = Time.new
      #sleep(5)
      puts time
      return time
    end 
end

