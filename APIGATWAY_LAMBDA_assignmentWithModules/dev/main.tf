terraform {
  backend "s3" {
    bucket = "ismaeelterraformbucket"
    key    = "dev/terraform.state"
    region = "us-east-1"
  }
}

provider "aws" {
region = "${var.AWS_REGION}"
}
module "my_lambda_functions" {
  source      = "../modules/lambdas"  
  create_function_name      = "ismaeeelcreatefucntion2"
  update_function_name    = "ismaeelupdatefunction2"
  delete_function_name     = "ismaeeldeletefunction2"
  get_function_name      = "ismaeelgetfunction2"
  create_function_runtime = "python3.7"
  update_function_runtime = "python3.7"
  delete_function_runtime = "python3.7"
  get_function_runtime = "python3.7"
}

module "my_api_gateway" {
  source      = "../modules/apigateways"   
  path      = "resources"
  endpoint    = "REGIONAL"
  stage_name     = "dev3"
  create_function_name2      = "${module.my_lambda_functions.create_function_name2}"
  update_function_name2    = "${module.my_lambda_functions.update_function_name2}"
  delete_function_name2     = "${module.my_lambda_functions.delete_function_name2}"
  get_function_name2      = "${module.my_lambda_functions.get_function_name2}"
  create_arn = "${module.my_lambda_functions.create_arn}"
  update_arn = "${module.my_lambda_functions.update_arn}"
  get_arn = "${module.my_lambda_functions.get_arn}"
  delete_arn = "${module.my_lambda_functions.delete_arn}"


}
