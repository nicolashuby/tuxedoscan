require 'webrick'
require 'json'

include WEBrick

class IpckeyServlet < HTTPServlet::AbstractServlet
def do_GET(req,resp)
        if req.query['tuxedo']
            tuxedo = req.query['tuxedo'].upcase
            filename = "data/ipckey"+tuxedo+".json"
            if File.file?(filename)        
                data = File.read(filename)
                resp['Content-Type'] = 'application/json'
                resp.body = data
                raise HTTPStatus::OK
            else
                resp.body = "#{filename} Not found"
                raise HTTPStatus::NotFound
            end
        end
    end
end
