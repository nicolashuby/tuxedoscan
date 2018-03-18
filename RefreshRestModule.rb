require 'webrick'
require 'json'

include WEBrick

class RefreshServlet < HTTPServlet::AbstractServlet
   def do_GET(req,resp)
	resp.body = getTime()
        raise HTTPStatus::OK
   end

    def getTime()
      time = Time.new
      sleep(5)
      return time.to_s
    end 
end

