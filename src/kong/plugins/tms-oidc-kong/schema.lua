local typedefs = require "kong.db.schema.typedefs"

return {
  name = "tms-oidc-kong",
  fields = {
    { consumer = typedefs.no_consumer },
    { config = {
      type = "record",
      fields = {
        { discovery = { type = "string", required = true }, },
        { ssl_verify = { type = "string", default = "yes" }, }
      }
    }, }
  }
}