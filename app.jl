using Genie, Genie.Router, Genie.Requests, Genie.Renderer.Json

function launchServer(port)
    Genie.config.run_as_server = true
    Genie.config.server_host = "0.0.0.0"
    Genie.config.server_port = port

    println("port set to $(port)")

route("/jsonpayload", method = POST) do
  @show jsonpayload()
  @show rawpayload()
  
  #save user data
  u = jsonpayload()["user_data"]

  # calculation
  u = sum(u)
  
  #json response
  json(u)
end

Genie.AppServer.startup()
end

launchServer(parse(Int, ARGS[1]))
