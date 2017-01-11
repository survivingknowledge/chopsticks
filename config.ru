require './config/environment'

use Rack::MethodOverride #needs to be first

use MealController
use FooditemController
use LoginController
run AppController