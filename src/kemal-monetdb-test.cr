require "kemal"
require "kemal-monetdb"

CONN_OPTS = {
  "host" => "172.17.0.2",
  "user" => "monetdb",
  "password" => "monetdb",
  "port" => "50000",
  "db" => "threatmonitor"
}

monetdb_connect CONN_OPTS

# Make sure to yield `env`.
get "/" do |env|
  env.content_type = "application/json"
  fruits = conn.query("SELECT * FROM fruits")
  # Release the connection after you are done with exec
  release
  # Renders the users as JSON
  fruits
end
