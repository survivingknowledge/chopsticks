require './config/environment'

use Rack::MethodOverride #needs to be first


use FooditemController
use LoginController
run AppController