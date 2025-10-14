local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
    s("javaclass", {
        -- Generate the package name
        f(function()
            local filepath = vim.fn.expand("%:p")
            local package_name

            -- Try to find /src/main/java/ first (Maven/Gradle)
            local src_index = filepath:find("/src/main/java/")
            if src_index then
                package_name = filepath:sub(src_index + 15)
            else
                -- Fallback to /src/
                src_index = filepath:find("/src/")
                if src_index then
                    package_name = filepath:sub(src_index + 5)
                end
            end

            if not package_name then
                return ""  -- no package path found
            end

            -- Remove filename (MyClass.java)
            package_name = package_name:match("(.*/)")
            if not package_name then
                return ""
            end

            -- Replace / with . and remove trailing dot
            package_name = package_name:gsub("/", "."):gsub("%.$", "")

            return "package " .. package_name .. ";"
        end, {}),

        -- new line
        t({ "", "" }),
        t({ "", "" }),

        -- Class declaration
        t("public class "),
        f(function()
            return vim.fn.expand("%:t:r")
        end, {}),
        t({" {", "\t"}),
        i(0),
        t({"", "}"})
    }),
}
