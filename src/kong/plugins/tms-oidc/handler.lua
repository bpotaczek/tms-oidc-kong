local BasePlugin = require "kong.plugins.base_plugin"

local kong = kong
local OidcHandler = BasePlugin:extend()

OidcHandler.VERSION = "1.0.0"
OidcHandler.PRIORITY = 1000

local function get_jwks()

end

function OidcHandler:new()
  OidcHandler.super.new(self, "tms-kong-oidc")
end

function OidcHandler:init_worker()
  OidcHandler.super.init_worker(self)
end

function OidcHandler:access(config)
  kong.log.err(config)
end

return OidcHandler
