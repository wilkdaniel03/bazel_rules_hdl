# Copyright 2025 Antmicro
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("//vc_static:defs.bzl", "vc_static_lint")
load("//verilog:defs.bzl", "verilog_library")

package(
    default_applicable_licenses = ["//:package_license"],
    default_visibility = ["//visibility:public"],
)

verilog_library(
    name = "rtl",
    srcs = [
        "rtl.sv",
    ],
)

filegroup(
    name = "test_waiver",
    srcs = [
        "test_waiver.policy",
    ],
)

filegroup(
    name = "test_config",
    srcs = [
        "test_config.tcl",
    ],
)

vc_static_lint(
    name = "rtl_vc_static_lint",
    config_files = [
        ":test_config",
    ],
    # buildifier: disable=unsorted-dict-items
    custom_severities = {
        "fatal": ["fatal"],
        "error": ["error"],
        "warning": ["warning"],
        "info": ["Info-Test"],
    },
    goal_name = "test_goal",
    module = ":rtl",
    module_top = "rtl",
    vc_static_env = "//vc_static/tests:vc_static_env.sh",
    waiver_files = [
        ":test_waiver",
    ],
)
