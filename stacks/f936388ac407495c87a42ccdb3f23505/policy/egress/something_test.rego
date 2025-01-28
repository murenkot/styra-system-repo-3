package stacks.f936388ac407495c87a42ccdb3f23505.policy.egress
import rego.v1

test_1 if {
   print(7777)

  data.acmebank.entitlements.withdraw.decision.allowed == true
    with input.subject.age as 40
    with input.subject.userid as "bob"
    with input.account.product_code as "direct-deposit"
    with input.account.status as "open"
    with input.account.owners as [
      "bob"
    ]
    
}

