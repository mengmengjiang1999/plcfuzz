ALWAYS ((pb1 && led) -> X(led2))
ALWAYS (!(pb1 && led) -> X(!led2))

ALWAYS (led2 -> X(!led))
ALWAYS (!led2 -> X(led))