class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path.match(/dogs/)
      return [200, { 'Content-Type' => 'application/json' }, [ Dog.all.to_json({:include => :puppies}) ]]
    elsif req.path.match(/puppies/)
      return [200, { 'Content-Type' => 'application/json' }, [ Puppy.all.to_json({:include => [:dog, :owner]}) ]]
    elsif req.path.match(/owners/)
      if req.env["REQUEST_METHOD"] === 'GET'
        if(req.path.split("/owners/").length <= 1)
          return [200, { 'Content-Type' => 'application/json' }, [ Owner.all.to_json({:include => [:dogs, :puppies]}) ]]
        else 
          owner_id = req.path.split("/owners/").last
          owner = Owner.find_by(id: owner_id)
          return [200, { 'Content-Type' => 'application/json' }, [ owner.to_json({:include => [:dogs, :puppies]}) ]]
        end
      elsif req.env["REQUEST_METHOD"] === 'POST'
        input = JSON.parse(req.body.read)
        owner = Owner.create(name: input["name"])
        if input["dog"]
          owner.dogs.create(input["dog"])
        end 
        return [200, { 'Content-Type' => 'application/json' }, [ owner.to_json ]]
      end 
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
