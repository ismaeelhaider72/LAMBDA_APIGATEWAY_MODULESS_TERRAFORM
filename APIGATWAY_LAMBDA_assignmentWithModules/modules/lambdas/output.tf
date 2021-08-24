//////////////////

output "create_function_name2" {
  value = "${aws_lambda_function.create_lambda.function_name}"
}

output "update_function_name2" {
  value = "${aws_lambda_function.update_lambda.function_name}"
}


output "delete_function_name2" {
  value = "${aws_lambda_function.delete_lambda.function_name}"
}

output "get_function_name2" {
  value = "${aws_lambda_function.get_lambda.function_name}"
}




////////////////////////////////// invoking arn ////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

output "create_arn" {
  value = "${aws_lambda_function.create_lambda.invoke_arn}"
}

output "update_arn" {
  value = "${aws_lambda_function.update_lambda.invoke_arn}"
}

output "delete_arn" {
  value = "${aws_lambda_function.delete_lambda.invoke_arn}"
}


output "get_arn" {
  value = "${aws_lambda_function.get_lambda.invoke_arn}"
}
