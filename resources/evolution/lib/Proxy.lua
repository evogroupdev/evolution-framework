local Tools = module("lib/Tools")

local Proxy = {}
local callbacks = {}

local function proxy_resolve(itable, key)
    local iname = getmetatable(itable).name

    local fcall = function(...)
        local args = { ... }
        local ids = getmetatable(itable).ids
        local rid = ids:gen()
        local promise = async()

        callbacks[rid] = promise
        TriggerEvent(iname .. ":proxy", key, args, rid)

        return promise:wait()
    end

    itable[key] = fcall
    return fcall
end

function Proxy.bindInterface(name, interface)
    AddEventHandler(name .. ":proxy", function(member, args, rid)
        local fn = interface[member]
        if type(fn) == "function" then
            local result = { fn(table.unpack(args)) }
            TriggerEvent(name .. ":proxy_res", rid, result)
        end
    end)
end

function Proxy.getInterface(name)
    local ids = Tools.newIDGenerator()

    local obj = setmetatable({}, {
        __index = proxy_resolve,
        name = name,
        ids = ids
    })

    AddEventHandler(name .. ":proxy_res", function(rid, rets)
        local cb = callbacks[rid]
        if cb then
            ids:free(rid)
            callbacks[rid] = nil
            cb(table.unpack(rets))
        end
    end)

    return obj
end

return Proxy
