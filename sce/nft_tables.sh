#!/usr/bin/env sh

#
# CIS-CAT Script Check Engine
#
# Name         Date       Description
# -------------------------------------------------------------------
# E. Pinnell   10/24/19   Check nftables tables
# E. Pinnell   05/18/20   Modified to include output when test is passed

nft list tables | grep -Eq "$XCCDF_VALUE_REGEX" && passing=true

# If the regex matched, output would be generated.  If so, we pass
if [ "$passing" = true ] ; then
	echo "Passed: $(nft list tables | grep -E "$XCCDF_VALUE_REGEX")"
    exit "${XCCDF_RESULT_PASS:-101}"
else
    # print the reason why we are failing
    echo "Missing nftables rule."
    exit "${XCCDF_RESULT_FAIL:-102}"
fi