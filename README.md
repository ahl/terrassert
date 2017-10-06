# Terrassert
Simple Terraform module for asserting value equality

Use it like this:

```
module "assert-something" {
  source   = "./assert"
  actual   = "${data.aws_iam_account_alias.current.account_alias}"
  expected = "my-non-production-aws-account"
}

data "aws_iam_account_alias" "current" {}
```
