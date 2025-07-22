define_severity -display "Info-Test" -override "info"

configure_lint_tag -enable -tag "W240" -severity "Info-Test" -goal test_goal
