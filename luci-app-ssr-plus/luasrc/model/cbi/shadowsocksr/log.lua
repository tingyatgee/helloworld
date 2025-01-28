require "luci.util"
require "nixio.fs"
require "luci.sys"
require "luci.http"

f = SimpleForm("logview")
f.reset = false
f.submit = false
f:append(Template("shadowsocksr/log"))

-- 自定义 log 函数
function log(...)
    local result = os.date("%Y-%m-%d %H:%M:%S: ") .. table.concat({...}, " ")
    local f, err = io.open("/var/log/ssrplus.log", "a")
    if f and err == nil then
        f:write(result .. "\n")
        f:close()
    end
end

return f
