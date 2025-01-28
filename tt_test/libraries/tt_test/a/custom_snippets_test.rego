package libraries.tt_test.a
import rego.v1

test_allow if {
    result := allow with input as {
        "user": "janet",
        "path": "/home",
        "method": "GET"
    }
    with data.groups as {
        "back-office": {
          "users": [
            "janet",
            "william"
          ]
        },
        "store-managers": {
          "users": [
            "alice"
          ]
        }
    }
    with data.library.parameters as {
        "group": "back-office",
        "method": "GET",
        "path": "/home"
    }


    print(result)
    result == {"User janet granted access to perform GET on path '/home' based on membership of group back-office"}
}

test_deny_not_member if {
    result := allow with input as {
        "user": "janet",
        "path": "/home",
        "method": "GET"
    }
    with data.groups as {
        "back-office": {
          "users": [
            "william"
          ]
        },
        "store-managers": {
          "users": [
            "janet"
          ]
        }
    }
    with data.library.parameters as {
        "group": "back-office",
        "method": "GET",
        "path": "/home"
    }

    print(result)
    result == set()
}

test_regex_in_path if {
    result := allow with input as {
        "user": "janet",
        "path": "/customers/123445",
        "method": "GET"
    }
    with data.groups as {
        "back-office": {
          "users": [
            "william",
            "janet"
          ]
        }
    }
    with data.library.parameters as {
        "group": "back-office",
        "method": "GET",
        "path": "/customers/[0-9]+"
    }

    print(result)
    result == {"User janet granted access to perform GET on path '/customers/123445' based on membership of group back-office"}
}

test_regex_lazy_match if {
    #when input path is substring of path parameter it shouldn't match
    result := allow with input as {
        "user": "janet",
        "path": "/customers/423423423",
        "method": "POST"
    }
    with data.groups as {
        "back-office": {
          "users": [
            "william",
            "janet"
          ]
        }
    }
    with data.library.parameters as {
        "group": "back-office",
        "method": "POST",
        "path": "/customers"
    }

    print(result)
    result == set()
}
