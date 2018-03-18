require 'webrick'
require 'json'

include WEBrick

class IpckeyServlet < HTTPServlet::AbstractServlet
def do_GET(req,resp)
        data = File.read('ipckeyTuxedo1.json')
        puts data
        resp['Content-Type'] = 'application/json'
        resp.body = data
        raise HTTPStatus::OK
    end
end
