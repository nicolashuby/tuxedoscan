require 'webrick'
require 'json'

include WEBrick

class IpckeyServlet < HTTPServlet::AbstractServlet
def do_GET(req,resp)
        data = File.read('data/ipckeyTuxedo1.json')
        resp['Content-Type'] = 'application/json'
        resp.body = data
        raise HTTPStatus::OK
    end
end
