```
BAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1TYW4gRnJhbmNp
c2NvMRowGAYDVQQDDBFBZG1pbkBleGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqG
SM49AwEHA0IABPimEGtDQFeAmglCbGdo4UDmyBQ5ktGZxVLl++/rqV9/AhT2hyt7
6TNyCnEZ9rPxI4rtwyyj+2H8B9s3lyxyHf6jTTBLMA4GA1UdDwEB/wQEAwIHgDAM
BgNVHRMBAf8EAjAAMCsGA1UdIwQkMCKAIEYFD0kwDTLNa31PSvIxRVQCOLC//48M
mA5qJcMFeVEHMAoGCCqGSM49BAMCA0gAMEUCIQCMdIl/xPHAWipc/7vamMTN5MhM
Z47GqU23dPDfDi77HAIgdrkL0Qo2UD1xzeAm6+Q/Djl8Mh2SZ6BYsdUqjbD09Oc=
-----END CERTIFICATE-----
2019-07-31 03:18:07.410 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:07.410 UTC [msp] Validate -> DEBU 036 MSP OrdererMSP validating identity
2019-07-31 03:18:07.411 UTC [msp] GetDefaultSigningIdentity -> DEBU 037 Obtaining default signing identity
2019-07-31 03:18:07.411 UTC [grpc] Printf -> DEBU 038 parsed scheme: ""
2019-07-31 03:18:07.411 UTC [grpc] Printf -> DEBU 039 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:07.411 UTC [grpc] Printf -> DEBU 03a ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-31 03:18:07.411 UTC [grpc] Printf -> DEBU 03b ClientConn switching balancer to "pick_first"
2019-07-31 03:18:07.411 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42041ea70, CONNECTING
2019-07-31 03:18:07.419 UTC [grpc] Printf -> DEBU 03d pickfirstBalancer: HandleSubConnStateChange: 0xc42041ea70, READY
2019-07-31 03:18:07.419 UTC [channelCmd] InitCmdFactory -> INFO 03e Endorser and orderer connections initialized
2019-07-31 03:18:07.420 UTC [msp] GetDefaultSigningIdentity -> DEBU 03f Obtaining default signing identity
2019-07-31 03:18:07.425 UTC [msp] GetDefaultSigningIdentity -> DEBU 040 Obtaining default signing identity
2019-07-31 03:18:07.425 UTC [msp/identity] Sign -> DEBU 041 Sign: plaintext: 0AC7060A1508051A0608EF9084EA0522...7DECEB89701712080A020A0012020A00 
2019-07-31 03:18:07.425 UTC [msp/identity] Sign -> DEBU 042 Sign: digest: F552FDA2EEB0EE13196938D102B627AAFBCC3532D50DAF42F7D9B8ABD6726001 
2019-07-31 03:18:07.428 UTC [cli/common] readBlock -> INFO 043 Received block: 3
2019-07-31 03:18:07.428 UTC [msp] GetDefaultSigningIdentity -> DEBU 044 Obtaining default signing identity
2019-07-31 03:18:07.428 UTC [msp] GetDefaultSigningIdentity -> DEBU 045 Obtaining default signing identity
2019-07-31 03:18:07.428 UTC [msp/identity] Sign -> DEBU 046 Sign: plaintext: 0AC7060A1508051A0608EF9084EA0522...A584BEE4613712080A021A0012021A00 
2019-07-31 03:18:07.428 UTC [msp/identity] Sign -> DEBU 047 Sign: digest: 8A88A66F71BBD5327EDE008451887F365A2FBFC19454EFDD8866217C7F761863 
2019-07-31 03:18:07.432 UTC [cli/common] readBlock -> INFO 048 Received block: 0
+ set +x
+ configtxlator proto_decode --input config_block.pb --type common.Block
+ jq '.data.data[0].payload.data.config'
Decoding config block to JSON and isolating config to config.json
+ set +x
+ jq -s '.[0] * {"channel_group":{"groups":{"Application":{"groups": {"Org3MSP":.[1]}}}}}' config.json ./channel-artifacts/org3.json
+ set +x
+ configtxlator proto_encode --input config.json --type common.Config
+ configtxlator proto_encode --input modified_config.json --type common.Config
+ configtxlator compute_update --channel_id mychannel --original original_config.pb --updated modified_config.pb
+ configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate
+ jq .
++ cat config_update.json
+ echo '{"payload":{"header":{"channel_header":{"channel_id":"mychannel", "type":2}},"data":{"config_update":{' '"channel_id":' '"mychannel",' '"read_set":' '{' '"groups":' '{' '"Application":' '{' '"groups":' '{' '"Org1MSP":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Org2MSP":' '{' '"mod_policy":' '"",' '"version":' '"0"' '}' '},' '"mod_policy":' '"",' '"policies":' '{' '"Admins":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Readers":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Writers":' '{' '"mod_policy":' '"",' '"version":' '"0"' '}' '},' '"values":' '{' '"Capabilities":' '{' '"mod_policy":' '"",' '"version":' '"0"' '}' '},' '"version":' '"1"' '}' '},' '"mod_policy":' '"",' '"version":' '"0"' '},' '"write_set":' '{' '"groups":' '{' '"Application":' '{' '"groups":' '{' '"Org1MSP":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Org2MSP":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Org3MSP":' '{' '"mod_policy":' '"Admins",' '"policies":' '{' '"Admins":' '{' '"mod_policy":' '"Admins",' '"policy":' '{' '"type":' 1, '"value":' '{' '"identities":' '[' '{' '"principal":' '{' '"msp_identifier":' '"Org3MSP",' '"role":' '"ADMIN"' '},' '"principal_classification":' '"ROLE"' '}' '],' '"rule":' '{' '"n_out_of":' '{' '"n":' 1, '"rules":' '[' '{' '"signed_by":' 0 '}' ']' '}' '},' '"version":' 0 '}' '},' '"version":' '"0"' '},' '"Readers":' '{' '"mod_policy":' '"Admins",' '"policy":' '{' '"type":' 1, '"value":' '{' '"identities":' '[' '{' '"principal":' '{' '"msp_identifier":' '"Org3MSP",' '"role":' '"MEMBER"' '},' '"principal_classification":' '"ROLE"' '}' '],' '"rule":' '{' '"n_out_of":' '{' '"n":' 1, '"rules":' '[' '{' '"signed_by":' 0 '}' ']' '}' '},' '"version":' 0 '}' '},' '"version":' '"0"' '},' '"Writers":' '{' '"mod_policy":' '"Admins",' '"policy":' '{' '"type":' 1, '"value":' '{' '"identities":' '[' '{' '"principal":' '{' '"msp_identifier":' '"Org3MSP",' '"role":' '"MEMBER"' '},' '"principal_classification":' '"ROLE"' '}' '],' '"rule":' '{' '"n_out_of":' '{' '"n":' 1, '"rules":' '[' '{' '"signed_by":' 0 '}' ']' '}' '},' '"version":' 0 '}' '},' '"version":' '"0"' '}' '},' '"values":' '{' '"MSP":' '{' '"mod_policy":' '"Admins",' '"value":' '{' '"config":' '{' '"admins":' '[' '"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNLakNDQWRHZ0F3SUJBZ0lSQUw1Zmc3TTZmQ0RaRXlTS25Gb1ovQkF3Q2dZSUtvWkl6ajBFQXdJd2N6RUwKTUFrR0ExVUVCaE1DVlZNeEV6QVJCZ05WQkFnVENrTmhiR2xtYjNKdWFXRXhGakFVQmdOVkJBY1REVk5oYmlCRwpjbUZ1WTJselkyOHhHVEFYQmdOVkJBb1RFRzl5WnpNdVpYaGhiWEJzWlM1amIyMHhIREFhQmdOVkJBTVRFMk5oCkxtOXlaek11WlhoaGJYQnNaUzVqYjIwd0hoY05NVGt3TnpNeE1ETXdPVFF4V2hjTk1qa3dOekk0TURNd09UUXgKV2pCc01Rc3dDUVlEVlFRR0V3SlZVekVUTUJFR0ExVUVDQk1LUTJGc2FXWnZjbTVwWVRFV01CUUdBMVVFQnhNTgpVMkZ1SUVaeVlXNWphWE5qYnpFUE1BMEdBMVVFQ3hNR1kyeHBaVzUwTVI4d0hRWURWUVFEREJaQlpHMXBia0J2CmNtY3pMbVY0WVcxd2JHVXVZMjl0TUZrd0V3WUhLb1pJemowQ0FRWUlLb1pJemowREFRY0RRZ0FFbmtIakl0Q1MKZ05kZnJmYTVoNGU3RFBVM3B6MFNPRVN6RFRIU2I4dDNmUG5tYU1OWEVJZ0J1bkJaRUJjNVREYVpCTm1xOXNEYwpsYUY3aWx3Q25wL3JENk5OTUVzd0RnWURWUjBQQVFIL0JBUURBZ2VBTUF3R0ExVWRFd0VCL3dRQ01BQXdLd1lEClZSMGpCQ1F3SW9BZzJzNXRVQm5lajRKalJnUFU4cUVpcTdRaDJ0bnFaaFNlTkJsQ3JlM3c4WTh3Q2dZSUtvWkkKemowRUF3SURSd0F3UkFJZ0VEVi9XTkYxQXI2endEMHBaUjBkUzJKNGl4Y2tuQlRmYmFicEtwcTQwbjhDSUF4ZQpDMU5wSWZOc2grcnRSNmVNWkxRczUvenBSYXhCWEpDaE9rY1QxcmtGCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"' '],' '"crypto_config":' '{' '"identity_identifier_hash_function":' '"SHA256",' '"signature_hash_family":' '"SHA2"' '},' '"fabric_node_ous":' '{' '"client_ou_identifier":' '{' '"certificate":' '"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRDdoZVhjVGZUWks3emsrNFhyRnBUREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NeTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEEzTXpFd016QTVOREZhRncweU9UQTNNamd3TXpBNU5ERmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3pMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jekxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKOEVqQ1BNWitrNTZnYS82MTZYZ0JCWHQrUGc0Y2ZCcW44UWtESTlPcWludlc2aUxsU1plbTlseFBLMWtCZDVMWApzaFVZWVNGSUVkeUF0S1JmbmFtQ3dLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMnM1dFVCbmVqNEpqUmdQVThxRWkKcTdRaDJ0bnFaaFNlTkJsQ3JlM3c4WTh3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQVBRcGJIeWY4aEhoY0VXMwphcFR3TzZCWU00ek9XVlRvM2pMblpHZk5KN3crQWlCSjBMZEpCWjZwSGJwcXd2UXd3ZDZlNHNJRXFvTUFkNThnCm1XK001Zi9Rbnc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",' '"organizational_unit_identifier":' '"client"' '},' '"enable":' true, '"peer_ou_identifier":' '{' '"certificate":' '"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRDdoZVhjVGZUWks3emsrNFhyRnBUREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NeTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEEzTXpFd016QTVOREZhRncweU9UQTNNamd3TXpBNU5ERmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3pMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jekxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKOEVqQ1BNWitrNTZnYS82MTZYZ0JCWHQrUGc0Y2ZCcW44UWtESTlPcWludlc2aUxsU1plbTlseFBLMWtCZDVMWApzaFVZWVNGSUVkeUF0S1JmbmFtQ3dLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMnM1dFVCbmVqNEpqUmdQVThxRWkKcTdRaDJ0bnFaaFNlTkJsQ3JlM3c4WTh3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQVBRcGJIeWY4aEhoY0VXMwphcFR3TzZCWU00ek9XVlRvM2pMblpHZk5KN3crQWlCSjBMZEpCWjZwSGJwcXd2UXd3ZDZlNHNJRXFvTUFkNThnCm1XK001Zi9Rbnc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",' '"organizational_unit_identifier":' '"peer"' '}' '},' '"name":' '"Org3MSP",' '"root_certs":' '[' '"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNRekNDQWVtZ0F3SUJBZ0lRRDdoZVhjVGZUWks3emsrNFhyRnBUREFLQmdncWhrak9QUVFEQWpCek1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWNNQm9HQTFVRUF4TVRZMkV1CmIzSm5NeTVsZUdGdGNHeGxMbU52YlRBZUZ3MHhPVEEzTXpFd016QTVOREZhRncweU9UQTNNamd3TXpBNU5ERmEKTUhNeEN6QUpCZ05WQkFZVEFsVlRNUk13RVFZRFZRUUlFd3BEWVd4cFptOXlibWxoTVJZd0ZBWURWUVFIRXcxVApZVzRnUm5KaGJtTnBjMk52TVJrd0Z3WURWUVFLRXhCdmNtY3pMbVY0WVcxd2JHVXVZMjl0TVJ3d0dnWURWUVFECkV4TmpZUzV2Y21jekxtVjRZVzF3YkdVdVkyOXRNRmt3RXdZSEtvWkl6ajBDQVFZSUtvWkl6ajBEQVFjRFFnQUUKOEVqQ1BNWitrNTZnYS82MTZYZ0JCWHQrUGc0Y2ZCcW44UWtESTlPcWludlc2aUxsU1plbTlseFBLMWtCZDVMWApzaFVZWVNGSUVkeUF0S1JmbmFtQ3dLTmZNRjB3RGdZRFZSMFBBUUgvQkFRREFnR21NQThHQTFVZEpRUUlNQVlHCkJGVWRKUUF3RHdZRFZSMFRBUUgvQkFVd0F3RUIvekFwQmdOVkhRNEVJZ1FnMnM1dFVCbmVqNEpqUmdQVThxRWkKcTdRaDJ0bnFaaFNlTkJsQ3JlM3c4WTh3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQVBRcGJIeWY4aEhoY0VXMwphcFR3TzZCWU00ek9XVlRvM2pMblpHZk5KN3crQWlCSjBMZEpCWjZwSGJwcXd2UXd3ZDZlNHNJRXFvTUFkNThnCm1XK001Zi9Rbnc9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="' '],' '"tls_root_certs":' '[' '"LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTVENDQWUrZ0F3SUJBZ0lRYzFmOW5DZWxwNmlKRTRrbWgxRFBsREFLQmdncWhrak9QUVFEQWpCMk1Rc3cKQ1FZRFZRUUdFd0pWVXpFVE1CRUdBMVVFQ0JNS1EyRnNhV1p2Y201cFlURVdNQlFHQTFVRUJ4TU5VMkZ1SUVaeQpZVzVqYVhOamJ6RVpNQmNHQTFVRUNoTVFiM0puTXk1bGVHRnRjR3hsTG1OdmJURWZNQjBHQTFVRUF4TVdkR3h6ClkyRXViM0puTXk1bGVHRnRjR3hsTG1OdmJUQWVGdzB4T1RBM016RXdNekE1TkRGYUZ3MHlPVEEzTWpnd016QTUKTkRGYU1IWXhDekFKQmdOVkJBWVRBbFZUTVJNd0VRWURWUVFJRXdwRFlXeHBabTl5Ym1saE1SWXdGQVlEVlFRSApFdzFUWVc0Z1JuSmhibU5wYzJOdk1Sa3dGd1lEVlFRS0V4QnZjbWN6TG1WNFlXMXdiR1V1WTI5dE1SOHdIUVlEClZRUURFeFowYkhOallTNXZjbWN6TG1WNFlXMXdiR1V1WTI5dE1Ga3dFd1lIS29aSXpqMENBUVlJS29aSXpqMEQKQVFjRFFnQUVjMVYxcGs5T0VUT2lkNUlVT1hLQVlTTnNkMGNYNHZTSGQxdjZraTFFdHo3V0NRUHJxUWhoa0I3cgpDNHpVK0pwWTEveHNsT2tqckFNa0Q3L2FjNHgwQmFOZk1GMHdEZ1lEVlIwUEFRSC9CQVFEQWdHbU1BOEdBMVVkCkpRUUlNQVlHQkZVZEpRQXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QXBCZ05WSFE0RUlnUWdNOGJCWnBrN1p3WWoKK0FMNmxUQ09aVU9wY0poMEwvYW9JMnBGY0lLaUNVSXdDZ1lJS29aSXpqMEVBd0lEU0FBd1JRSWhBS0dZMXpOcQpUWHA2a0tSNUtLL28vUitIWHUxYmpKck4wSkZwckRTYTVXQndBaUF0OUI2YWJtYWtKUkRIcFc1WnFkeTQralppCnQ1eVZkaUFSeEFBNGdBTHIwZz09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"' ']' '},' '"type":' 0 '},' '"version":' '"0"' '}' '},' '"version":' '"0"' '}' '},' '"mod_policy":' '"Admins",' '"policies":' '{' '"Admins":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Readers":' '{' '"mod_policy":' '"",' '"version":' '"0"' '},' '"Writers":' '{' '"mod_policy":' '"",' '"version":' '"0"' '}' '},' '"values":' '{' '"Capabilities":' '{' '"mod_policy":' '"",' '"version":' '"0"' '}' '},' '"version":' '"2"' '}' '},' '"mod_policy":' '"",' '"version":' '"0"' '}' '}}}}'
+ configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope
+ set +x
+ peer channel signconfigtx -f org3_update_in_envelope.pb

========= Config transaction to add org3 to network created ===== 

Signing config transaction

2019-07-31 03:18:07.907 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:07.907 UTC [viperutil] unmarshalJSON -> DEBU 002 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:07.907 UTC [viperutil] getKeysRecursively -> DEBU 003 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:07.907 UTC [viperutil] getKeysRecursively -> DEBU 004 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:07.908 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:07.908 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:07.908 UTC [viperutil] getKeysRecursively -> DEBU 007 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:07.908 UTC [viperutil] unmarshalJSON -> DEBU 008 Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:07.908 UTC [viperutil] getKeysRecursively -> DEBU 009 Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:07.908 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:07.908 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:07.908 UTC [viperutil] getKeysRecursively -> DEBU 00c Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:07.908 UTC [viperutil] unmarshalJSON -> DEBU 00d Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.909 UTC [viperutil] getKeysRecursively -> DEBU 00e Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:07.909 UTC [viperutil] unmarshalJSON -> DEBU 00f Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.909 UTC [viperutil] getKeysRecursively -> DEBU 010 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:07.910 UTC [viperutil] unmarshalJSON -> DEBU 011 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.910 UTC [viperutil] getKeysRecursively -> DEBU 012 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:07.910 UTC [viperutil] unmarshalJSON -> DEBU 013 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.910 UTC [viperutil] getKeysRecursively -> DEBU 014 Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:07.910 UTC [viperutil] getKeysRecursively -> DEBU 015 Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:07.911 UTC [viperutil] unmarshalJSON -> DEBU 016 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.911 UTC [viperutil] getKeysRecursively -> DEBU 017 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:07.911 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.911 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:07.911 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[Default:SW SW:map[Security:256 FileKeyStore:map[KeyStore:] Hash:SHA2] PKCS11:map[Library:<nil> Label:<nil> Pin:<nil> Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>]]]]
2019-07-31 03:18:07.911 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore]...done
2019-07-31 03:18:07.912 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts
2019-07-31 03:18:07.912 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:07.912 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:07.912 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls
2019-07-31 03:18:07.912 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:07.912 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:07.913 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:07.913 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:07.913 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:07.913 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org1MSP
2019-07-31 03:18:07.914 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAKwL9xaY0COhUgiLRaYIVoEwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BPiwb8bVZfTpB5AxlB9vbnLoG0IxlOJxlw1xkb/gBW9cJ/eeLUXOgCKs3K1Vuyz7
zFs+se8bTCmgUIH+gwamceujXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIFRizNsXX1jz0vLwsMQq
SJBykz1NmN1F+xnpH3ex9gM/MAoGCCqGSM49BAMCA0gAMEUCIQC8NSEsFoPGQLRW
tqItSjF+pfA+WEdtb8m0TEhbOvbUFgIgAyZSpk6fjoctwBpe2TvyQEO9plEpnS8W
/oazM32vtFQ=
-----END CERTIFICATE-----
2019-07-31 03:18:07.914 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:07.932 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:07.932 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737_sk]...
2019-07-31 03:18:07.932 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:07.932 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:07.934 UTC [msp] Validate -> DEBU 036 MSP Org1MSP validating identity
2019-07-31 03:18:07.935 UTC [msp] GetDefaultSigningIdentity -> DEBU 037 Obtaining default signing identity
2019-07-31 03:18:07.935 UTC [channelCmd] InitCmdFactory -> INFO 038 Endorser and orderer connections initialized
2019-07-31 03:18:07.935 UTC [msp] GetDefaultSigningIdentity -> DEBU 039 Obtaining default signing identity
2019-07-31 03:18:07.935 UTC [msp] GetDefaultSigningIdentity -> DEBU 03a Obtaining default signing identity
2019-07-31 03:18:07.935 UTC [msp/identity] Sign -> DEBU 03b Sign: plaintext: 0AB6060A074F7267314D535012AA062D...72697465727312002A0641646D696E73 
2019-07-31 03:18:07.935 UTC [msp/identity] Sign -> DEBU 03c Sign: digest: 0DFF9EBAED512348505B25EB7E514B2E0B3895BB673C768372E21C27CEC10F95 
2019-07-31 03:18:07.935 UTC [msp] GetDefaultSigningIdentity -> DEBU 03d Obtaining default signing identity
2019-07-31 03:18:07.935 UTC [msp] GetDefaultSigningIdentity -> DEBU 03e Obtaining default signing identity
2019-07-31 03:18:07.935 UTC [msp/identity] Sign -> DEBU 03f Sign: plaintext: 0AED060A1508021A0608EF9084EA0522...026EEA2941828312FBD7B18FAD7C8DFA 
2019-07-31 03:18:07.935 UTC [msp/identity] Sign -> DEBU 040 Sign: digest: 0F939922E71FC440A59034FCA00C8D75DF843788C6CA3D5C139CB27BB8EE0178 
+ set +x
+ peer channel update -f org3_update_in_envelope.pb -c mychannel -o orderer.example.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

========= Submitting transaction from a different peer (peer0.org2) which also signs it ========= 

2019-07-31 03:18:07.991 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:07.991 UTC [viperutil] unmarshalJSON -> DEBU 002 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:07.991 UTC [viperutil] getKeysRecursively -> DEBU 003 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:07.991 UTC [viperutil] getKeysRecursively -> DEBU 004 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:07.992 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:07.992 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:07.993 UTC [viperutil] unmarshalJSON -> DEBU 007 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 008 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 009 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:07.993 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 00c Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 00d Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:07.993 UTC [viperutil] unmarshalJSON -> DEBU 00e Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.993 UTC [viperutil] getKeysRecursively -> DEBU 00f Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:07.994 UTC [viperutil] unmarshalJSON -> DEBU 010 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.994 UTC [viperutil] getKeysRecursively -> DEBU 011 Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:07.994 UTC [viperutil] unmarshalJSON -> DEBU 012 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.994 UTC [viperutil] getKeysRecursively -> DEBU 013 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:07.995 UTC [viperutil] unmarshalJSON -> DEBU 014 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.995 UTC [viperutil] getKeysRecursively -> DEBU 015 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:07.995 UTC [viperutil] unmarshalJSON -> DEBU 016 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.995 UTC [viperutil] getKeysRecursively -> DEBU 017 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:07.995 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:07.995 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:07.995 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[Default:SW SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]] PKCS11:map[Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>] Library:<nil> Label:<nil> Pin:<nil>]]]
2019-07-31 03:18:07.996 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore]...done
2019-07-31 03:18:07.996 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts/ca.org2.example.com-cert.pem
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts
2019-07-31 03:18:07.996 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts/tlsca.org2.example.com-cert.pem
2019-07-31 03:18:07.996 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:07.997 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:07.997 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls
2019-07-31 03:18:07.997 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:07.997 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:07.997 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:07.997 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:07.997 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:07.997 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org2MSP
2019-07-31 03:18:07.999 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAO9e3eKad47WU+v0AaK8cnQwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzIuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzIuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMi5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BLR9stUikbQWbLjQ9+4cAZmP/69khec9y1OGfb7isgEYoQH3hCuu/AAEqsSaTsxx
QT4D/TGXiq6ck16POlv33LGjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIK/2v8bU/iCIUJ65Pa00
o/vmeLccg4jWcJjv47RuHTR5MAoGCCqGSM49BAMCA0gAMEUCIQDDi1I4DiVGT9vS
z0r4vGTjRMace06LM/plTnGUIbV3WAIgMm+GGwU7tM8iIGGKp+7icx7FM9nAqDVp
5pnKmWC8BOw=
-----END CERTIFICATE-----
2019-07-31 03:18:07.999 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:08.022 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:08.022 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a_sk]...
2019-07-31 03:18:08.022 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:08.022 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:08.023 UTC [msp] Validate -> DEBU 036 MSP Org2MSP validating identity
2019-07-31 03:18:08.023 UTC [msp] GetDefaultSigningIdentity -> DEBU 037 Obtaining default signing identity
2019-07-31 03:18:08.023 UTC [grpc] Printf -> DEBU 038 parsed scheme: ""
2019-07-31 03:18:08.023 UTC [grpc] Printf -> DEBU 039 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:08.023 UTC [grpc] Printf -> DEBU 03a ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-31 03:18:08.023 UTC [grpc] Printf -> DEBU 03b ClientConn switching balancer to "pick_first"
2019-07-31 03:18:08.023 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42051cac0, CONNECTING
2019-07-31 03:18:08.026 UTC [grpc] Printf -> DEBU 03d pickfirstBalancer: HandleSubConnStateChange: 0xc42051cac0, READY
2019-07-31 03:18:08.026 UTC [channelCmd] InitCmdFactory -> INFO 03e Endorser and orderer connections initialized
2019-07-31 03:18:08.026 UTC [msp] GetDefaultSigningIdentity -> DEBU 03f Obtaining default signing identity
2019-07-31 03:18:08.026 UTC [msp] GetDefaultSigningIdentity -> DEBU 040 Obtaining default signing identity
2019-07-31 03:18:08.026 UTC [msp/identity] Sign -> DEBU 041 Sign: plaintext: 0AB6060A074F7267324D535012AA062D...72697465727312002A0641646D696E73 
2019-07-31 03:18:08.026 UTC [msp/identity] Sign -> DEBU 042 Sign: digest: 8FBE872FC3D9899D419ACBF5EC716671F9A8948D77D26BB1B0D39FB290DDE8A3 
2019-07-31 03:18:08.026 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-31 03:18:08.026 UTC [msp] GetDefaultSigningIdentity -> DEBU 044 Obtaining default signing identity
2019-07-31 03:18:08.027 UTC [msp/identity] Sign -> DEBU 045 Sign: plaintext: 0AED060A1508021A0608F09084EA0522...8BAA726B0E9394A02C937FF84381CA72 
2019-07-31 03:18:08.027 UTC [msp/identity] Sign -> DEBU 046 Sign: digest: 1F2C33F83160C6EB5F29B628F91829C9686033D7935C3776FEE4B7FB631C216F 
2019-07-31 03:18:08.027 UTC [grpc] Printf -> DEBU 047 parsed scheme: ""
2019-07-31 03:18:08.027 UTC [grpc] Printf -> DEBU 048 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:08.027 UTC [grpc] Printf -> DEBU 049 ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-31 03:18:08.027 UTC [grpc] Printf -> DEBU 04a ClientConn switching balancer to "pick_first"
2019-07-31 03:18:08.027 UTC [grpc] Printf -> DEBU 04b pickfirstBalancer: HandleSubConnStateChange: 0xc42051dfc0, CONNECTING
2019-07-31 03:18:08.031 UTC [grpc] Printf -> DEBU 04c pickfirstBalancer: HandleSubConnStateChange: 0xc42051dfc0, READY
2019-07-31 03:18:08.066 UTC [channelCmd] update -> INFO 04d Successfully submitted channel update
+ set +x

========= Config transaction to add org3 to network submitted! =========== 

Creating volume "net_peer0.org3.example.com" with default driver
Creating volume "net_peer1.org3.example.com" with default driver
WARNING: Found orphan containers (cli, orderer.example.com, peer0.org2.example.com, peer0.org1.example.com, peer1.org2.example.com, peer1.org1.example.com) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Creating peer1.org3.example.com ... done
Creating peer0.org3.example.com ... done
Creating Org3cli                ... done

###############################################################
############### Have Org3 peers join network ##################
###############################################################

========= Getting Org3 on to your first network ========= 

Fetching channel config block from orderer...
+ peer channel fetch 0 mychannel.block -o orderer.example.com:7050 -c mychannel --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
+ res=0
+ set +x
2019-07-31 03:18:12.123 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-07-31 03:18:12.133 UTC [cli/common] readBlock -> INFO 002 Received block: 0
+ peer channel join -b mychannel.block
+ res=0
+ set +x
2019-07-31 03:18:12.234 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-07-31 03:18:12.283 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
===================== peer0.org3 joined channel 'mychannel' ===================== 
+ peer channel join -b mychannel.block
+ res=0
+ set +x
2019-07-31 03:18:12.380 UTC [channelCmd] InitCmdFactory -> INFO 001 Endorser and orderer connections initialized
2019-07-31 03:18:12.435 UTC [channelCmd] executeJoin -> INFO 002 Successfully submitted proposal to join channel
===================== peer1.org3 joined channel 'mychannel' ===================== 
Installing chaincode 2.0 on peer0.org3...
+ peer chaincode install -n mycc -v 2.0 -l golang -p github.com/chaincode/chaincode_example02/go/
+ res=0
+ set +x
2019-07-31 03:18:12.523 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 001 Using default escc
2019-07-31 03:18:12.523 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 002 Using default vscc
2019-07-31 03:18:12.996 UTC [chaincodeCmd] install -> INFO 003 Installed remotely response:<status:200 payload:"OK" > 
===================== Chaincode is installed on peer0.org3 ===================== 


========= Org3 is now halfway onto your first network ========= 


###############################################################
##### Upgrade chaincode to have Org3 peers on the network #####
###############################################################

========= Finish adding Org3 to your first network ========= 

===================== Installing chaincode 2.0 on peer0.org1 ===================== 
+ peer chaincode install -n mycc -v 2.0 -l golang -p github.com/chaincode/chaincode_example02/go/
+ res=0
+ set +x
2019-07-31 03:18:13.483 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:13.484 UTC [viperutil] getKeysRecursively -> DEBU 002 Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:13.484 UTC [viperutil] unmarshalJSON -> DEBU 003 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.484 UTC [viperutil] getKeysRecursively -> DEBU 004 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:13.485 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.485 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:13.486 UTC [viperutil] unmarshalJSON -> DEBU 007 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.488 UTC [viperutil] getKeysRecursively -> DEBU 008 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:13.488 UTC [viperutil] unmarshalJSON -> DEBU 009 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.488 UTC [viperutil] getKeysRecursively -> DEBU 00a Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:13.488 UTC [viperutil] getKeysRecursively -> DEBU 00b Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:13.489 UTC [viperutil] unmarshalJSON -> DEBU 00c Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.489 UTC [viperutil] getKeysRecursively -> DEBU 00d Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:13.489 UTC [viperutil] unmarshalJSON -> DEBU 00e Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.489 UTC [viperutil] getKeysRecursively -> DEBU 00f Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:13.489 UTC [viperutil] unmarshalJSON -> DEBU 010 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.489 UTC [viperutil] getKeysRecursively -> DEBU 011 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:13.490 UTC [viperutil] getKeysRecursively -> DEBU 012 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:13.490 UTC [viperutil] getKeysRecursively -> DEBU 013 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:13.490 UTC [viperutil] unmarshalJSON -> DEBU 014 Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:13.490 UTC [viperutil] getKeysRecursively -> DEBU 015 Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:13.490 UTC [viperutil] unmarshalJSON -> DEBU 016 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.490 UTC [viperutil] getKeysRecursively -> DEBU 017 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:13.490 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:13.490 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:13.490 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[PKCS11:map[Label:<nil> Pin:<nil> Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>] Library:<nil>] Default:SW SW:map[FileKeyStore:map[KeyStore:] Hash:SHA2 Security:256]]]
2019-07-31 03:18:13.490 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore]...done
2019-07-31 03:18:13.499 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:13.499 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts
2019-07-31 03:18:13.500 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:13.500 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts
2019-07-31 03:18:13.501 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
2019-07-31 03:18:13.501 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:13.501 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:13.501 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls
2019-07-31 03:18:13.501 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:13.501 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:13.502 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:13.502 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:13.502 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:13.502 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org1MSP
2019-07-31 03:18:13.502 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAKwL9xaY0COhUgiLRaYIVoEwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BPiwb8bVZfTpB5AxlB9vbnLoG0IxlOJxlw1xkb/gBW9cJ/eeLUXOgCKs3K1Vuyz7
zFs+se8bTCmgUIH+gwamceujXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIFRizNsXX1jz0vLwsMQq
SJBykz1NmN1F+xnpH3ex9gM/MAoGCCqGSM49BAMCA0gAMEUCIQC8NSEsFoPGQLRW
tqItSjF+pfA+WEdtb8m0TEhbOvbUFgIgAyZSpk6fjoctwBpe2TvyQEO9plEpnS8W
/oazM32vtFQ=
-----END CERTIFICATE-----
2019-07-31 03:18:13.503 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:13.520 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:13.520 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737_sk]...
2019-07-31 03:18:13.520 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:13.521 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:13.521 UTC [msp] Validate -> DEBU 036 MSP Org1MSP validating identity
2019-07-31 03:18:13.522 UTC [grpc] Printf -> DEBU 037 parsed scheme: ""
2019-07-31 03:18:13.522 UTC [grpc] Printf -> DEBU 038 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.522 UTC [grpc] Printf -> DEBU 039 ccResolverWrapper: sending new addresses to cc: [{peer0.org1.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.522 UTC [grpc] Printf -> DEBU 03a ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.522 UTC [grpc] Printf -> DEBU 03b pickfirstBalancer: HandleSubConnStateChange: 0xc4204b5a70, CONNECTING
2019-07-31 03:18:13.524 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc4204b5a70, READY
2019-07-31 03:18:13.525 UTC [grpc] Printf -> DEBU 03d parsed scheme: ""
2019-07-31 03:18:13.525 UTC [grpc] Printf -> DEBU 03e scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.525 UTC [grpc] Printf -> DEBU 03f ccResolverWrapper: sending new addresses to cc: [{peer0.org1.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.525 UTC [grpc] Printf -> DEBU 040 ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.525 UTC [grpc] Printf -> DEBU 041 pickfirstBalancer: HandleSubConnStateChange: 0xc42037bb40, CONNECTING
2019-07-31 03:18:13.527 UTC [grpc] Printf -> DEBU 042 pickfirstBalancer: HandleSubConnStateChange: 0xc42037bb40, READY
2019-07-31 03:18:13.527 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-31 03:18:13.527 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 044 Using default escc
2019-07-31 03:18:13.527 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 045 Using default vscc
2019-07-31 03:18:13.527 UTC [chaincodeCmd] getChaincodeSpec -> DEBU 046 java chaincode disabled
2019-07-31 03:18:13.581 UTC [golang-platform] getCodeFromFS -> DEBU 047 getCodeFromFS github.com/chaincode/chaincode_example02/go/
2019-07-31 03:18:13.707 UTC [golang-platform] func1 -> DEBU 048 Discarding GOROOT package fmt
2019-07-31 03:18:13.707 UTC [golang-platform] func1 -> DEBU 049 Discarding provided package github.com/hyperledger/fabric/core/chaincode/shim
2019-07-31 03:18:13.707 UTC [golang-platform] func1 -> DEBU 04a Discarding provided package github.com/hyperledger/fabric/protos/peer
2019-07-31 03:18:13.707 UTC [golang-platform] func1 -> DEBU 04b Discarding GOROOT package strconv
2019-07-31 03:18:13.707 UTC [golang-platform] GetDeploymentPayload -> DEBU 04c done
2019-07-31 03:18:13.708 UTC [container] WriteFileToPackage -> DEBU 04d Writing file to tarball: src/github.com/chaincode/chaincode_example02/go/chaincode_example02.go
2019-07-31 03:18:13.709 UTC [msp/identity] Sign -> DEBU 04e Sign: plaintext: 0AB4070A5C08031A0C08F59084EA0510...21E3DF010000FFFFBAA5A18C001C0000 
2019-07-31 03:18:13.709 UTC [msp/identity] Sign -> DEBU 04f Sign: digest: 140A408E6B541CCE50516E534AB84647F3F0E60BE63853547816E202FF3AE035 
2019-07-31 03:18:13.712 UTC [chaincodeCmd] install -> INFO 050 Installed remotely response:<status:200 payload:"OK" > 
===================== Chaincode is installed on peer0.org1 ===================== 

===================== Installing chaincode 2.0 on peer0.org2 ===================== 
+ peer chaincode install -n mycc -v 2.0 -l golang -p github.com/chaincode/chaincode_example02/go/
+ res=0
+ set +x
2019-07-31 03:18:13.772 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 002 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 003 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 004 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 007 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 008 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 009 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 00c Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 00d Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 00e Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 00f Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 010 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 011 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 012 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 013 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 014 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] unmarshalJSON -> DEBU 015 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 016 Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 017 Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:13.775 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[Default:SW SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]] PKCS11:map[Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>] Library:<nil> Label:<nil> Pin:<nil>]]]
2019-07-31 03:18:13.776 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore]...done
2019-07-31 03:18:13.776 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts/ca.org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts/tlsca.org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:13.777 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:13.777 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:13.777 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:13.777 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org2MSP
2019-07-31 03:18:13.777 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAO9e3eKad47WU+v0AaK8cnQwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzIuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzIuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMi5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BLR9stUikbQWbLjQ9+4cAZmP/69khec9y1OGfb7isgEYoQH3hCuu/AAEqsSaTsxx
QT4D/TGXiq6ck16POlv33LGjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIK/2v8bU/iCIUJ65Pa00
o/vmeLccg4jWcJjv47RuHTR5MAoGCCqGSM49BAMCA0gAMEUCIQDDi1I4DiVGT9vS
z0r4vGTjRMace06LM/plTnGUIbV3WAIgMm+GGwU7tM8iIGGKp+7icx7FM9nAqDVp
5pnKmWC8BOw=
-----END CERTIFICATE-----
2019-07-31 03:18:13.777 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.797 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.797 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a_sk]...
2019-07-31 03:18:13.798 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.798 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:13.798 UTC [msp] Validate -> DEBU 036 MSP Org2MSP validating identity
2019-07-31 03:18:13.799 UTC [grpc] Printf -> DEBU 037 parsed scheme: ""
2019-07-31 03:18:13.799 UTC [grpc] Printf -> DEBU 038 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 039 ccResolverWrapper: sending new addresses to cc: [{peer0.org2.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 03a ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 03b pickfirstBalancer: HandleSubConnStateChange: 0xc42044ba60, CONNECTING
2019-07-31 03:18:13.804 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42044ba60, READY
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03d parsed scheme: ""
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03e scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03f ccResolverWrapper: sending new addresses to cc: [{peer0.org2.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 040 ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 041 pickfirstBalancer: HandleSubConnStateChange: 0xc420493b30, CONNECTING
2019-07-31 03:18:13.809 UTC [grpc] Printf -> DEBU 042 pickfirstBalancer: HandleSubConnStateChange: 0xc420493b30, READY
2019-07-31 03:18:13.810 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-31 03:18:13.810 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 044 Using default escc
2019-07-31 03:18:13.810 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 045 Using default vscc
2019-07-31 03:18:13.810 UTC [chaincodeCmd] getChaincodeSpec -> DEBU 046 java chaincode disabled
2019-07-31 03:18:13.850 UTC [golang-platform] getCodeFromFS -> DEBU 047 getCodeFromFS github.com/chaincode/chaincode_example02/go/
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 048 Discarding GOROOT package fmt
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 049 Discarding provided package github.com/hyperledger/fabric/core/chaincode/shim
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 04a Discarding provided package github.com/hyperledger/fabric/protos/peer
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 04b Discarding GOROOT package strconv
2019-07-31 03:18:13.969 UTC [golang-platform] GetDeploymentPayload -> DEBU 04c done
2019-07-31 03:18:13.969 UTC [container] WriteFileToPackage -> DEBU 04d Writing file to tarball: src/github.com/chaincode/chaincode_example02/go/chaincode_example02.go
2019-07-31 03:18:13.971 UTC [msp/identity] Sign -> DEBU 04e Sign: plaintext: 0AB4070A5C08031A0C08F59084EA0510...21E3DF010000FFFFBAA5A18C001C0000 
2019-07-31 03:18:13.971 UTC [msp/identity] Sign -> DEBU 04f Sign: digest: C43C49763068D9CCD278E5153561BBBA43D9AECC2432D96233F7770A7FC0C91A 
2019-07-31 03:18:13.975 UTC [chaincodeCmd] install -> INFO 050 Installed remotely response:<status:200 payload:"OK" > 
===================== Chaincode is installed on peer0.org2 ===================== 

===================== Upgrading chaincode on peer0.org1 ===================== 
+ peer chaincode upgrade -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycc -v 2.0 -c '{"Args":["init","a","90","b","210"]}' -P 'AND ('\''Org1MSP.peer'\'','\''Org2MSP.peer'\'','\''Org3MSP.peer'\'')'
2019-07-31 03:18:14.037 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:14.038 UTC [viperutil] getKeysRecursively -> DEBU 002 Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:14.038 UTC [viperutil] unmarshalJSON -> DEBU 003 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.038 UTC [viperutil] getKeysRecursively -> DEBU 004 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:14.039 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.039 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:14.039 UTC [viperutil] getKeysRecursively -> DEBU 007 Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:14.040 UTC [viperutil] unmarshalJSON -> DEBU 008 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.041 UTC [viperutil] getKeysRecursively -> DEBU 009 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:14.041 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.041 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:14.042 UTC [viperutil] unmarshalJSON -> DEBU 00c Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.042 UTC [viperutil] getKeysRecursively -> DEBU 00d Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:14.042 UTC [viperutil] unmarshalJSON -> DEBU 00e Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:14.042 UTC [viperutil] getKeysRecursively -> DEBU 00f Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:14.043 UTC [viperutil] unmarshalJSON -> DEBU 010 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:14.043 UTC [viperutil] getKeysRecursively -> DEBU 011 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:14.045 UTC [viperutil] getKeysRecursively -> DEBU 012 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:14.045 UTC [viperutil] unmarshalJSON -> DEBU 013 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:14.045 UTC [viperutil] getKeysRecursively -> DEBU 014 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:14.045 UTC [viperutil] unmarshalJSON -> DEBU 015 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:14.045 UTC [viperutil] getKeysRecursively -> DEBU 016 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:14.045 UTC [viperutil] getKeysRecursively -> DEBU 017 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:14.045 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:14.045 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:14.045 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[PKCS11:map[Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>] Library:<nil> Label:<nil> Pin:<nil>] Default:SW SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]]]]
2019-07-31 03:18:14.045 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore]...done
2019-07-31 03:18:14.047 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:14.047 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts
2019-07-31 03:18:14.048 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:14.048 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts
2019-07-31 03:18:14.049 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:14.049 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:14.049 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls
2019-07-31 03:18:14.049 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:14.049 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:14.050 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:14.050 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:14.050 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:14.050 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org1MSP
2019-07-31 03:18:14.051 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAKwL9xaY0COhUgiLRaYIVoEwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMS5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BPiwb8bVZfTpB5AxlB9vbnLoG0IxlOJxlw1xkb/gBW9cJ/eeLUXOgCKs3K1Vuyz7
zFs+se8bTCmgUIH+gwamceujXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIFRizNsXX1jz0vLwsMQq
SJBykz1NmN1F+xnpH3ex9gM/MAoGCCqGSM49BAMCA0gAMEUCIQC8NSEsFoPGQLRW
tqItSjF+pfA+WEdtb8m0TEhbOvbUFgIgAyZSpk6fjoctwBpe2TvyQEO9plEpnS8W
/oazM32vtFQ=
-----END CERTIFICATE-----
2019-07-31 03:18:14.052 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:14.075 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:14.075 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/95e4b6be074432c2bbef6b0cdd3ae10f412532137d8febafd773af224d234737_sk]...
2019-07-31 03:18:14.076 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdGgAwIBAgIRANrFYEARB0MiLqf0edAZ7bkwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzEuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzEuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBsMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEPMA0GA1UECxMGY2xpZW50MR8wHQYDVQQDDBZBZG1pbkBv
cmcxLmV4YW1wbGUuY29tMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEmzOm7pe2
Xg3iqACjRo+DvkYmQqch1Ik4nJdoTHoWHrA486eHCY8hWdP+uZzROLLkJU1Las+u
fu+jlVIRAsBny6NNMEswDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwKwYD
VR0jBCQwIoAgVGLM2xdfWPPS8vCwxCpIkHKTPU2Y3UX7Gekfd7H2Az8wCgYIKoZI
zj0EAwIDRwAwRAIgJiXmpwYRkAmsUDI7B85svvI/oZ3OI0KRj51R+fP1wRUCIBEt
7IVlub2RDjICEUqC2XTuBgGZm8pNBLbBeKgB1pPj
-----END CERTIFICATE-----
2019-07-31 03:18:14.076 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:14.076 UTC [msp] Validate -> DEBU 036 MSP Org1MSP validating identity
2019-07-31 03:18:14.077 UTC [grpc] Printf -> DEBU 037 parsed scheme: ""
2019-07-31 03:18:14.077 UTC [grpc] Printf -> DEBU 038 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:14.077 UTC [grpc] Printf -> DEBU 039 ccResolverWrapper: sending new addresses to cc: [{peer0.org1.example.com:7051 0  <nil>}]
2019-07-31 03:18:14.077 UTC [grpc] Printf -> DEBU 03a ClientConn switching balancer to "pick_first"
2019-07-31 03:18:14.077 UTC [grpc] Printf -> DEBU 03b pickfirstBalancer: HandleSubConnStateChange: 0xc42023bab0, CONNECTING
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42023bab0, READY
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 03d parsed scheme: ""
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 03e scheme "" not registered, fallback to default scheme
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 03f ccResolverWrapper: sending new addresses to cc: [{peer0.org1.example.com:7051 0  <nil>}]
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 040 ClientConn switching balancer to "pick_first"
2019-07-31 03:18:14.084 UTC [grpc] Printf -> DEBU 041 pickfirstBalancer: HandleSubConnStateChange: 0xc420227b80, CONNECTING
2019-07-31 03:18:14.088 UTC [grpc] Printf -> DEBU 042 pickfirstBalancer: HandleSubConnStateChange: 0xc420227b80, READY
2019-07-31 03:18:14.088 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-31 03:18:14.089 UTC [grpc] Printf -> DEBU 044 parsed scheme: ""
2019-07-31 03:18:14.089 UTC [grpc] Printf -> DEBU 045 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:14.089 UTC [grpc] Printf -> DEBU 046 ccResolverWrapper: sending new addresses to cc: [{orderer.example.com:7050 0  <nil>}]
2019-07-31 03:18:14.089 UTC [grpc] Printf -> DEBU 047 ClientConn switching balancer to "pick_first"
2019-07-31 03:18:14.090 UTC [grpc] Printf -> DEBU 048 pickfirstBalancer: HandleSubConnStateChange: 0xc4204f8170, CONNECTING
2019-07-31 03:18:14.093 UTC [grpc] Printf -> DEBU 049 pickfirstBalancer: HandleSubConnStateChange: 0xc4204f8170, READY
2019-07-31 03:18:14.093 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 04a Using default escc
2019-07-31 03:18:14.093 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 04b Using default vscc
2019-07-31 03:18:14.093 UTC [chaincodeCmd] getChaincodeSpec -> DEBU 04c java chaincode disabled
2019-07-31 03:18:14.094 UTC [chaincodeCmd] upgrade -> DEBU 04d Get upgrade proposal for chaincode <name:"mycc" version:"2.0" >
2019-07-31 03:18:14.094 UTC [msp/identity] Sign -> DEBU 04e Sign: plaintext: 0ABE070A6608031A0B08F69084EA0510...535010030A04657363630A0476736363 
2019-07-31 03:18:14.094 UTC [msp/identity] Sign -> DEBU 04f Sign: digest: 9A1E84E62A033780F1EF25694E173FF07A8D146AAB67EA3806D9290E1EA027D2 
2019-07-31 03:18:41.501 UTC [chaincodeCmd] upgrade -> DEBU 050 endorse upgrade proposal, get response <status:200 payload:"\n\004mycc\022\0032.0\032\004escc\"\004vscc*?\022\020\022\016\010\003\022\002\010\000\022\002\010\001\022\002\010\002\032\r\022\013\n\007Org1MSP\020\003\032\r\022\013\n\007Org2MSP\020\003\032\r\022\013\n\007Org3MSP\020\0032D\n _\363\037|y\314\247\352\314\033\036R\014\333\335\\<?\377\374C\260_-\237\353Ho\220\251\320\336\022 g\357,\324!\221P`u\035X\006\327\257\037\324\334\003\003\251\2628\321\345\262$\360\r\351\220^\\: F\310WF\352!\310\001\336\316\311c\364\266\270x\177\243y\316\035|Sj\031\244\251zI\255\251\355B?\022\020\022\016\010\001\022\002\010\000\022\002\010\001\022\002\010\002\032\r\022\013\n\007Org1MSP\020\001\032\r\022\013\n\007Org2MSP\020\001\032\r\022\013\n\007Org3MSP\020\001" >
2019-07-31 03:18:41.502 UTC [msp/identity] Sign -> DEBU 051 Sign: plaintext: 0ABE070A6608031A0B08F69084EA0510...A55BFA1408DBDFC6AC7938B2AE3F0D66 
2019-07-31 03:18:41.503 UTC [msp/identity] Sign -> DEBU 052 Sign: digest: 1D7BB136132B1C544B408DF074E5EB4F7E729BDD36D059ED498AAD49F228EF47 
2019-07-31 03:18:41.504 UTC [chaincodeCmd] upgrade -> DEBU 053 Get Signed envelope
2019-07-31 03:18:41.504 UTC [chaincodeCmd] chaincodeUpgrade -> DEBU 054 Send signed envelope to orderer
+ res=0
+ set +x
2019-07-31 03:18:13.772 UTC [viperutil] getKeysRecursively -> DEBU 001 Found map[string]interface{} value for peer.BCCSP
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 002 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 003 Found real value for peer.BCCSP.Default setting to string SW
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 004 Found map[string]interface{} value for peer.BCCSP.SW
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 005 Unmarshal JSON: value cannot be unmarshalled: invalid character 'S' looking for beginning of value
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 006 Found real value for peer.BCCSP.SW.Hash setting to string SHA2
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 007 Unmarshal JSON: value is not a string: 256
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 008 Found real value for peer.BCCSP.SW.Security setting to int 256
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 009 Found map[string]interface{} value for peer.BCCSP.SW.FileKeyStore
2019-07-31 03:18:13.773 UTC [viperutil] unmarshalJSON -> DEBU 00a Unmarshal JSON: value cannot be unmarshalled: unexpected end of JSON input
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 00b Found real value for peer.BCCSP.SW.FileKeyStore.KeyStore setting to string 
2019-07-31 03:18:13.773 UTC [viperutil] getKeysRecursively -> DEBU 00c Found map[string]interface{} value for peer.BCCSP.PKCS11
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 00d Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 00e Found real value for peer.BCCSP.PKCS11.Library setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 00f Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 010 Found real value for peer.BCCSP.PKCS11.Label setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 011 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.774 UTC [viperutil] getKeysRecursively -> DEBU 012 Found real value for peer.BCCSP.PKCS11.Pin setting to <nil> <nil>
2019-07-31 03:18:13.774 UTC [viperutil] unmarshalJSON -> DEBU 013 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 014 Found real value for peer.BCCSP.PKCS11.Hash setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] unmarshalJSON -> DEBU 015 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 016 Found real value for peer.BCCSP.PKCS11.Security setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 017 Found map[string]interface{} value for peer.BCCSP.PKCS11.FileKeyStore
2019-07-31 03:18:13.775 UTC [viperutil] unmarshalJSON -> DEBU 018 Unmarshal JSON: value is not a string: <nil>
2019-07-31 03:18:13.775 UTC [viperutil] getKeysRecursively -> DEBU 019 Found real value for peer.BCCSP.PKCS11.FileKeyStore.KeyStore setting to <nil> <nil>
2019-07-31 03:18:13.775 UTC [viperutil] EnhancedExactUnmarshalKey -> DEBU 01a map[peer.BCCSP:map[Default:SW SW:map[Hash:SHA2 Security:256 FileKeyStore:map[KeyStore:]] PKCS11:map[Hash:<nil> Security:<nil> FileKeyStore:map[KeyStore:<nil>] Library:<nil> Label:<nil> Pin:<nil>]]]
2019-07-31 03:18:13.776 UTC [bccsp_sw] openKeyStore -> DEBU 01b KeyStore opened at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore]...done
2019-07-31 03:18:13.776 UTC [bccsp] initBCCSP -> DEBU 01c Initialize BCCSP [SW]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01d Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01e Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 01f Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 020 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/cacerts/ca.org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 021 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 022 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/admincerts/Admin@org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 023 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 024 Intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/intermediatecerts: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 025 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 026 Inspecting file /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlscacerts/tlsca.org2.example.com-cert.pem
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 027 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 028 TLS intermediate certs folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/tlsintermediatecerts: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getPemMaterialFromDir -> DEBU 029 Reading directory /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 02a crls folder not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls]. Skipping. [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/crls: no such file or directory]
2019-07-31 03:18:13.776 UTC [msp] getMspConfig -> DEBU 02b MSP configuration file not found at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml]: [stat /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/config.yaml: no such file or directory]
2019-07-31 03:18:13.777 UTC [msp] newBccspMsp -> DEBU 02c Creating BCCSP-based MSP instance
2019-07-31 03:18:13.777 UTC [msp] New -> DEBU 02d Creating Cache-MSP instance
2019-07-31 03:18:13.777 UTC [msp] loadLocaMSP -> DEBU 02e Created new local MSP
2019-07-31 03:18:13.777 UTC [msp] Setup -> DEBU 02f Setting up MSP instance Org2MSP
2019-07-31 03:18:13.777 UTC [msp/identity] newIdentity -> DEBU 030 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICRDCCAeqgAwIBAgIRAO9e3eKad47WU+v0AaK8cnQwCgYIKoZIzj0EAwIwczEL
MAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBG
cmFuY2lzY28xGTAXBgNVBAoTEG9yZzIuZXhhbXBsZS5jb20xHDAaBgNVBAMTE2Nh
Lm9yZzIuZXhhbXBsZS5jb20wHhcNMTkwNzMxMDIxNjUxWhcNMjkwNzI4MDIxNjUx
WjBzMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMN
U2FuIEZyYW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UE
AxMTY2Eub3JnMi5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IA
BLR9stUikbQWbLjQ9+4cAZmP/69khec9y1OGfb7isgEYoQH3hCuu/AAEqsSaTsxx
QT4D/TGXiq6ck16POlv33LGjXzBdMA4GA1UdDwEB/wQEAwIBpjAPBgNVHSUECDAG
BgRVHSUAMA8GA1UdEwEB/wQFMAMBAf8wKQYDVR0OBCIEIK/2v8bU/iCIUJ65Pa00
o/vmeLccg4jWcJjv47RuHTR5MAoGCCqGSM49BAMCA0gAMEUCIQDDi1I4DiVGT9vS
z0r4vGTjRMace06LM/plTnGUIbV3WAIgMm+GGwU7tM8iIGGKp+7icx7FM9nAqDVp
5pnKmWC8BOw=
-----END CERTIFICATE-----
2019-07-31 03:18:13.777 UTC [msp/identity] newIdentity -> DEBU 031 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.797 UTC [msp/identity] newIdentity -> DEBU 032 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.797 UTC [bccsp_sw] loadPrivateKey -> DEBU 033 Loading private key [4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a] at [/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/4b35ce4f2ecc97d74148e5e24fc106fb6ff0fa100c73ae6b5bf603187218cf1a_sk]...
2019-07-31 03:18:13.798 UTC [msp/identity] newIdentity -> DEBU 034 Creating identity instance for cert -----BEGIN CERTIFICATE-----
MIICKjCCAdCgAwIBAgIQL+2Rk7hbFlYcMEGxN4U03zAKBggqhkjOPQQDAjBzMQsw
CQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNU2FuIEZy
YW5jaXNjbzEZMBcGA1UEChMQb3JnMi5leGFtcGxlLmNvbTEcMBoGA1UEAxMTY2Eu
b3JnMi5leGFtcGxlLmNvbTAeFw0xOTA3MzEwMjE2NTFaFw0yOTA3MjgwMjE2NTFa
MGwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpDYWxpZm9ybmlhMRYwFAYDVQQHEw1T
YW4gRnJhbmNpc2NvMQ8wDQYDVQQLEwZjbGllbnQxHzAdBgNVBAMMFkFkbWluQG9y
ZzIuZXhhbXBsZS5jb20wWTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAARS6Jh+xKv3
EtlWTkbabiCzOIbDR9ew6IxN/SHOavNvR2fQR92Iyu9teaqUCSXMX7ge8bnOX5LW
HsttI1blIy00o00wSzAOBgNVHQ8BAf8EBAMCB4AwDAYDVR0TAQH/BAIwADArBgNV
HSMEJDAigCCv9r/G1P4giFCeuT2tNKP75ni3HIOI1nCY7+O0bh00eTAKBggqhkjO
PQQDAgNIADBFAiEAtZSK/vyqhqnMm6OIWMz9nbOQPjoLyY6vQWEv636h878CIBmZ
dW6bP7hpwr8rughuBj7eKfSdCBRXLnlokYG0CILT
-----END CERTIFICATE-----
2019-07-31 03:18:13.798 UTC [msp] setupSigningIdentity -> DEBU 035 Signing identity expires at 2029-07-28 02:16:51 +0000 UTC
2019-07-31 03:18:13.798 UTC [msp] Validate -> DEBU 036 MSP Org2MSP validating identity
2019-07-31 03:18:13.799 UTC [grpc] Printf -> DEBU 037 parsed scheme: ""
2019-07-31 03:18:13.799 UTC [grpc] Printf -> DEBU 038 scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 039 ccResolverWrapper: sending new addresses to cc: [{peer0.org2.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 03a ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.800 UTC [grpc] Printf -> DEBU 03b pickfirstBalancer: HandleSubConnStateChange: 0xc42044ba60, CONNECTING
2019-07-31 03:18:13.804 UTC [grpc] Printf -> DEBU 03c pickfirstBalancer: HandleSubConnStateChange: 0xc42044ba60, READY
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03d parsed scheme: ""
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03e scheme "" not registered, fallback to default scheme
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 03f ccResolverWrapper: sending new addresses to cc: [{peer0.org2.example.com:7051 0  <nil>}]
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 040 ClientConn switching balancer to "pick_first"
2019-07-31 03:18:13.805 UTC [grpc] Printf -> DEBU 041 pickfirstBalancer: HandleSubConnStateChange: 0xc420493b30, CONNECTING
2019-07-31 03:18:13.809 UTC [grpc] Printf -> DEBU 042 pickfirstBalancer: HandleSubConnStateChange: 0xc420493b30, READY
2019-07-31 03:18:13.810 UTC [msp] GetDefaultSigningIdentity -> DEBU 043 Obtaining default signing identity
2019-07-31 03:18:13.810 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 044 Using default escc
2019-07-31 03:18:13.810 UTC [chaincodeCmd] checkChaincodeCmdParams -> INFO 045 Using default vscc
2019-07-31 03:18:13.810 UTC [chaincodeCmd] getChaincodeSpec -> DEBU 046 java chaincode disabled
2019-07-31 03:18:13.850 UTC [golang-platform] getCodeFromFS -> DEBU 047 getCodeFromFS github.com/chaincode/chaincode_example02/go/
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 048 Discarding GOROOT package fmt
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 049 Discarding provided package github.com/hyperledger/fabric/core/chaincode/shim
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 04a Discarding provided package github.com/hyperledger/fabric/protos/peer
2019-07-31 03:18:13.969 UTC [golang-platform] func1 -> DEBU 04b Discarding GOROOT package strconv
2019-07-31 03:18:13.969 UTC [golang-platform] GetDeploymentPayload -> DEBU 04c done
2019-07-31 03:18:13.969 UTC [container] WriteFileToPackage -> DEBU 04d Writing file to tarball: src/github.com/chaincode/chaincode_example02/go/chaincode_example02.go
2019-07-31 03:18:13.971 UTC [msp/identity] Sign -> DEBU 04e Sign: plaintext: 0AB4070A5C08031A0C08F59084EA0510...21E3DF010000FFFFBAA5A18C001C0000 
2019-07-31 03:18:13.971 UTC [msp/identity] Sign -> DEBU 04f Sign: digest: C43C49763068D9CCD278E5153561BBBA43D9AECC2432D96233F7770A7FC0C91A 
2019-07-31 03:18:13.975 UTC [chaincodeCmd] install -> INFO 050 Installed remotely response:<status:200 payload:"OK" > 
===================== Chaincode is upgraded on peer0.org1 on channel 'mychannel' ===================== 


========= Finished adding Org3 to your first network! ========= 


 ____    _____      _      ____    _____ 
/ ___|  |_   _|    / \    |  _ \  |_   _|
\___ \    | |     / _ \   | |_) |   | |  
 ___) |   | |    / ___ \  |  _ <    | |  
|____/    |_|   /_/   \_\ |_| \_\   |_|  

Extend your first network (EYFN) test

Channel name : mychannel
Querying chaincode on peer0.org3...
===================== Querying on peer0.org3 on channel 'mychannel'... ===================== 
Attempting to Query peer0.org3 ...3 secs
+ peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
+ res=0
+ set +x

90
===================== Query successful on peer0.org3 on channel 'mychannel' ===================== 
Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3...
+ peer chaincode invoke -o orderer.example.com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n mycc --peerAddresses peer0.org1.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses peer0.org2.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt --peerAddresses peer0.org3.example.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
+ res=0
+ set +x
2019-07-31 03:19:37.155 UTC [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Chaincode invoke successful. result: status:200 
===================== Invoke transaction successful on peer0.org1 peer0.org2 peer0.org3 on channel 'mychannel' ===================== 

Querying chaincode on peer0.org3...
===================== Querying on peer0.org3 on channel 'mychannel'... ===================== 
Attempting to Query peer0.org3 ...3 secs
+ peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
+ res=0
+ set +x

80
===================== Query successful on peer0.org3 on channel 'mychannel' ===================== 
Querying chaincode on peer0.org2...
===================== Querying on peer0.org2 on channel 'mychannel'... ===================== 
Attempting to Query peer0.org2 ...3 secs
+ peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
+ res=0
+ set +x

80
===================== Query successful on peer0.org2 on channel 'mychannel' ===================== 
Querying chaincode on peer0.org1...
===================== Querying on peer0.org1 on channel 'mychannel'... ===================== 
Attempting to Query peer0.org1 ...3 secs
+ peer chaincode query -C mychannel -n mycc -c '{"Args":["query","a"]}'
+ res=0
+ set +x

80
===================== Query successful on peer0.org1 on channel 'mychannel' ===================== 

========= All GOOD, EYFN test execution completed =========== 


 _____   _   _   ____   
| ____| | \ | | |  _ \  
|  _|   |  \| | | | | | 
| |___  | |\  | | |_| | 
|_____| |_| \_| |____/  

```
