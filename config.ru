require './config/environment'

use Rack::MethodOverride #needs to be first

use UsermealController
use MealController
use FooditemController
use LoginController
run AppController