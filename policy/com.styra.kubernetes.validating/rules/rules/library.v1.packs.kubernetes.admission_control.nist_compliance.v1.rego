package policy["com.styra.kubernetes.validating"].rules.rules
not_configured[decision] {
  parameters := {
    "whitelist": set()
  }

  data.library.v1.kubernetes.admission.storage.v1.enforce_pod_flex_volume_drivers_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "whitelist": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_app_armor_profile_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

  
monitor[decision] {
  data.library.v1.kubernetes.admission.network.v1.deny_host_namespace_sharing[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.deny_host_network[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "host_port_ranges": set()
  }

  data.library.v1.kubernetes.admission.network.v1.enforce_pod_hostports_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.enforce_container_mustrunasnonroot[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.block_privileged_mode[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "run_as_group_rule": "",
    "group_id_ranges": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_pod_runas_groupid_rule_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "user_id_ranges": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_pod_runas_userid_rule_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "whitelist": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_seccomp_profile_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "level": "",
    "role": "",
    "type": "",
    "user": ""
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_selinux_options_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "capabilities": set(),
    "exclude": {}
  }

  data.library.v1.kubernetes.admission.workload.v1.deny_capabilities_in_blacklist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "allowed_unsafe_sysctls": set(),
    "forbidden_sysctls": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.deny_unsafe_and_forbidden_sysctls[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.deny_privilege_escalation[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "allowed": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.deny_host_path_not_in_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "whitelist": set()
  }

  data.library.v1.kubernetes.admission.workload.v1.enforce_proc_mount_type_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "fs_group_rule": "",
    "fs_group_ranges": set()
  }

  data.library.v1.kubernetes.admission.storage.v1.enforce_pod_fsgroup_rule_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.missing_read_only_filesystem[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

not_configured[decision] {
  parameters := {
    "whitelist": set()
  }

  data.library.v1.kubernetes.admission.storage.v1.enforce_pod_volume_type_whitelist[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
