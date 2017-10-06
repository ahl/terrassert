variable "actual" {}
variable "expected" {}

data "external" "assert" {
  program = ["jq", <<EOF
    if .actual == .expected then
      { "status":"ok" }
    else
      error("assertion failure\n  expected: ${var.expected}\n  actual:   ${var.actual}")
    end
EOF
  ]

  query {
    actual   = "${var.actual}"
    expected = "${var.expected}"
  }
}
