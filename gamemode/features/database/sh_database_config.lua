require("mysqloo")
gloonz.database = gloonz.database or {}
local config = gloonz.database

config.host = ""
config.port = ""
config.name = ""
config.username = ""
config.password = ""


gloonz.database.connect = function()

    gloonz_database = mysqloo.connect(config.host, config.username, config.password, config.name, config.port)
    gloonz_database.onConnected = function(db) print("Connected to Database: " .. config.name) end
    gloonz_database.onConnectionFailed = function(db, e) print("Could not connect to Database: " .. config.name .. "\n" .. e) end
    gloonz_database:connect()

end

gloonz.database.disconnect = function()

    gloonz_database:disconnect()
    print("Successfully disconnected from " .. config.name)

end

----------------------------------------------------------------------

gloonz.database.createTable = function(tableName, fields) 

    gloonz.database.connect()

    local string = ""
    local counter = 1
    for _, info in ipairs(fields) do
        local comma = ""
        if counter ~= #fields then
            comma = ", "
        end
        string = string .. info.name .. " " .. string.upper(info.type) .. comma
        counter = counter + 1
    end
    local create_table = gloonz_database:query("CREATE TABLE IF NOT EXISTS " .. tableName .. " (" .. string .. ")"   )
    create_table.onSuccess = function() print("Table: " .. tableName .. " was created") gloonz.database.disconnect() end
    create_table.onError = function(q, e) print("An error happened creating table " .. tableName .. ": \n" .. e) gloonz.database.disconnect() end
    create_table:start()

end

gloonz.database.query = function(query, callback)

    gloonz.database.connect()

    local run = gloonz_database:query(query)
    run.onSuccess = function(q, data) print("Query: " .. q .. " was successful") print(data) gloonz.database.disconnect() end
    run.onError = function(q, e) print("An error happened with query: " .. q .. "\n".. e) gloonz.database.disconnect() end
    run:start()

end