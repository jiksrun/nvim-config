local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Helper: generate package name from file path
local function get_package_name()
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
        return ""
    end

    -- Remove filename (MyClass.java)
    package_name = package_name:match("(.*/)")
    if not package_name then
        return ""
    end

    -- Replace / with . and remove trailing dot
    package_name = package_name:gsub("/", "."):gsub("%.$", "")

    return "package " .. package_name .. ";"
end

-- Helper: get class name
local function get_class_name()
    return vim.fn.expand("%:t:r")
end

return {
    -- System.out.println()
    s("sop", {
        t("System.out.println("),
        i(1),
        t(");"),
    }),

    -- Java Main
    s("javamain", {
        f(get_package_name, {}),
        t({ "", "", "" }),
        t("public class "),
        f(get_class_name, {}),
        t({ " {", "\t" }),
        t({ "public static void main(String[] args) {", "\t\t" }),
        i(0),
        t({ "", "\t}", "}" }),
    }),

    -- Normal Java class
    s("javaclass", {
        f(get_package_name, {}),
        t({ "", "", "" }),
        t("public class "),
        f(get_class_name, {}),
        t({ " {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    -- Abstract Java class
    s("javaabstract", {
        f(get_package_name, {}),
        t({ "", "", "" }),
        t("public abstract class "),
        f(get_class_name, {}),
        t({ " {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),

    -- Java interface
    s("javainterface", {
        f(get_package_name, {}),
        t({ "", "", "" }),
        t("public interface "),
        f(get_class_name, {}),
        t({ " {", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}
