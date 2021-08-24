locals{

    lambda_zip_location_create = "${path.module}/output/ismaeelCreatedFunctionp.zip"
    lambda_zip_location_get = "${path.module}/output/ismaeelGetITFucntionp.zip"
    lambda_zip_location_delete = "${path.module}/output/ismaeeldeleteFunctionp.zip"
    lambda_zip_location_update = "${path.module}/output/ismaeelUpdateFunctionp.zip"
}



data "archive_file" "create" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelCreatedFunctionp.py"
  output_path = "${local.lambda_zip_location_create}"
}



data "archive_file" "get" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelGetITFucntionp.py"
  output_path = "${local.lambda_zip_location_get}"
}


data "archive_file" "delete" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeeldeleteFunctionp.py"
  output_path = "${local.lambda_zip_location_delete}"
}


data "archive_file" "update" {
  type        = "zip"
  source_file = "${path.module}/lambda_functions/ismaeelUpdateFunctionp.py"
  output_path = "${local.lambda_zip_location_update}"
}






///////////////////////////////// create function ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////


resource "aws_lambda_function" "create_lambda" {
  filename      = "${local.lambda_zip_location_create}"
  function_name = "${var.create_function_name}"
  role          = aws_iam_role.create_role.arn
  handler       = "ismaeelCreatedFunctionp.lambda_handler"

  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "${var.create_function_runtime}"


}



///////////////////////////////// get function ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////


resource "aws_lambda_function" "get_lambda" {
  filename      = "${local.lambda_zip_location_get}"
  function_name = "${var.get_function_name}"
  role          = aws_iam_role.get_role.arn
  handler       = "ismaeelGetITFucntionp.lambda_handler"

  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "${var.get_function_runtime}"


}




///////////////////////////////// delete function ////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////


resource "aws_lambda_function" "delete_lambda" {
  filename      = "${local.lambda_zip_location_delete}"
  function_name = "${var.delete_function_name}"
  role          = aws_iam_role.delete_role.arn
  handler       = "ismaeeldeleteFunctionp.lambda_handler"

  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "${var.delete_function_runtime}"


}




///////////////////////////////// update function ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////


resource "aws_lambda_function" "update_lambda" {
  filename      = "${local.lambda_zip_location_update}"
  function_name = "${var.update_function_name}"
  role          = aws_iam_role.update_role.arn
  #role          = "arn:aws:iam::489994096722:role/service-role/ismaeelUpdateFunction-role-0vtte6k9"
  handler       = "ismaeelUpdateFunctionp.lambda_handler"

  #source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime ="${var.update_function_runtime}"


}






