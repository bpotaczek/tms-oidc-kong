local BasePlugin = require "kong.plugins.base_plugin"
local oidc = require "resty.openidc"
local kong = kong
local OidcHandler = BasePlugin:extend()

OidcHandler.VERSION = "1.0.0"
OidcHandler.PRIORITY = 1000

function OidcHandler:access(config)
  local request_header = kong.request.get_headers()
  local auth_header = request_header["Authorization"]
  if not auth_header then
    local err = "Authorization header not found"
    kong.log.err(err)
    return kong.response.exit(401, "Unauthorized: " .. err)
  end
  local opts = {
    discovery = config.discovery,
    ssl_verify = config.ssl_verify,
    redirect_uri = "",
  }
  local res, e, token = oidc.bearer_jwt_verify(opts)
  if e then
    kong.log.err(e)
    local msg = "Unauthorized: "
    if string.match(e, "claim expired") then
      msg = msg .. "Token has expired"
    elseif string.match(e, "invalid header") then
      msg = msg .. "Invalid Jwt token"
    else
      msg = msg .. "Unknown error"
    end
    return kong.response.exit(401, msg)
  end
  kong.service.request.set_header("X-Authentication", token)
end

return OidcHandler