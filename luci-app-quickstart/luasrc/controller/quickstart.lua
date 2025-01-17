local http = require "luci.http"

module("luci.controller.quickstart", package.seeall)

local page_index = {"admin", "quickstart", "pages"}

function index()
    entry({"admin", "quickstart"}, call("redirect_index"), _("QuickStart"), 1)
    entry({"admin", "network_guide"}, call("networkguide_index"), _("NetworkGuide"), 2)
    entry({"admin", "quickstart", "pages"}, call("quickstart_index")).leaf = true
end

function networkguide_index()
    luci.http.redirect(luci.dispatcher.build_url("admin","quickstart","pages","network"))
end

function redirect_index()
    luci.http.redirect(luci.dispatcher.build_url(unpack(page_index)))
end

function quickstart_index()
    luci.template.render("quickstart/main", {prefix=luci.dispatcher.build_url(unpack(page_index))})
end