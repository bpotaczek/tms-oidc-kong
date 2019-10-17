package = "tms-kong-oidc"
version = "1.0-0"
source = {
    url = "",
    tag = "v1.0-0",
    dir = "tms-kong-oidc"
}
description = {
    summary = "A KochInd specific Kong plugin for implementing the OpenID Connect with IdentityServer4",
    detailed = [[
    ]],
    homepage = "",
    license = "Apache 2.0"
}
dependencies = {
}
build = {
    type = "builtin",
    modules = {
    ["kong.plugins.tms-oidc.handler"] = "src/kong/plugins/tms-oidc/handler.lua",
    }
}