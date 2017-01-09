require './config/environment'

use Rack::MethodOverride #needs to be first

use LoginController
run AppController