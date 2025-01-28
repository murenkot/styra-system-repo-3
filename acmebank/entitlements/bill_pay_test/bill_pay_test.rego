package acmebank.entitlements.bill_pay_test

import rego.v1

# METADATA
# title: Positive
test_1 if {
  data.acmebank.entitlements.bill_pay.decision.allowed == true
    with input.subject.age as 65
    with input.subject.userid as "alice"
    with input.account.product_code as "direct-deposit"
    with input.account.status as "open"
    with input.account.owners as [
      "alice"
    ]
}


# METADATA
# title: Web block exists
test_2 if {
  data.acmebank.entitlements.bill_pay.decision.allowed == false
    with input.subject.age as 65
    with input.subject.userid as "alice"
    with input.account.product_code as "direct-deposit"
    with input.account.status as "open"
    with input.account.owners as [
      "alice"
    ]
    with input.subject.service_codes as [
      "wbx"
    ]
}