ADMIN_PATH = '/admin'
WEB_SERVER_PORT = 3000
ADMIN_SERVER_PORT = 19899

class SimpleApp
  def call(env)
    request = Rack::Request.new(env)
    request_path = env['REQUEST_PATH']

    if request_path.start_with?(ADMIN_PATH)
      [ 301, {'Location' => "http://localhost:#{ADMIN_SERVER_PORT}#{request_path}" }, self ]
    else
      [ 301, {'Location' => "http://localhost:#{WEB_SERVER_PORT}#{request_path}" }, self ]
    end
  end
  def each(&block)
  end
end