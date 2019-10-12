# The string encodes to slightly different values with the
# standard and URL base64 encoders (trailing `+` vs `-`)
# but they both decode to the original string as desired.
$ v run base64-encoding.v
YWJjMTIzIT8kKiYoKSctPUB+
abc123!?$*&()'-=@~

YWJjMTIzIT8kKiYoKSctPUB-
abc123!?$*&()'-=@~
