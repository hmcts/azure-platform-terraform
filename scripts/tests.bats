setup() {
    load 'test/test_helper/bats-support/load'
    load 'test/test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
}
GLOBAL_DOMAIN="sandbox.platform.hmcts.net"

@test "Test http redirect (plum)" {
    output=$(curl -s -o /dev/null -w "%{http_code}" "http://plum.$GLOBAL_DOMAIN/")
    assert_output '301'
    output=$(curl -s -o /dev/null -w "%{redirect_url}" "http://plum.$GLOBAL_DOMAIN/")
    assert_output "https://plum.$GLOBAL_DOMAIN/"
}

@test "Test http response (plum/health)" {
    output=$(curl -s "https://plum.$GLOBAL_DOMAIN/health" | jq -r .status)
    assert_output "UP"
}

@test "Test http response (plum)" {
    output=$(curl -s "https://plum.$GLOBAL_DOMAIN/")
    assert_output --partial "There are no recipes"
}

@test "Test http response (plum/health) - Failure" {
    output=$(curl -s "https://plum.$GLOBAL_DOMAIN/health" | jq -r .status)
    assert_output "Down"
}
