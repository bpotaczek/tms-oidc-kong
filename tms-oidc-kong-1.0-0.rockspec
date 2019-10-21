package = "tms-oidc-kong"
version = "1.0-0"
source = {
    url = "https://github.com/bpotaczek/tms-oidc-kong",
    tag = "v0.0.0-alpha"
}
description = {
    summary = "A specific Kong plugin for implementing the OpenID Connect with IdentityServer4",
    detailed = [[
    ]],
    homepage = "",
    license = "Apache 2.0"
}
dependencies = {
  'lua >= 5.1',
  'lua-resty-openidc',
}
build = {
    type = "builtin",
    modules = {
        ["kong.plugins.tms-oidc-kong.handler"] = "src/kong/plugins/tms-oidc-kong/handler.lua",
        ["kong.plugins.tms-oidc-kong.schema"] = "src/kong/plugins/tms-oidc-kong/schema.lua",
    }
}