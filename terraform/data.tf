data "aws_lb" "nlb" {
  name = var.nlb_name
}

data "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = data.aws_lb.nlb.arn
  port              = 80
}

data "aws_security_group" "alb_sg" {
  id = tolist(data.aws_lb.nlb.security_groups)[0]
}

data "aws_lambda_function" "lambda_authorizer" {
  function_name = var.lambda_authorizer_name
}