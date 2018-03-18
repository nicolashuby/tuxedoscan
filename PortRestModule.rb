require 'webrick'
require 'json'

include WEBrick

class PortServlet < HTTPServlet::AbstractServlet
def do_GET(req,resp)
        data = File.read('data/portTuxedo1.json')
        resp['Content-Type'] = 'application/json'
        resp.body = data
        raise HTTPStatus::OK
    end
end
