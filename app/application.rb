require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path.match(/dogs/)
      return [200, { 'Content-Type' => 'application/json' }, [ Dog.all.to_json ]]
      # binding.pry
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
