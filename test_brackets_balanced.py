#
# Given a string of round, curly, and square open and closing brackets,
# return whether the brackets are balanced (well-formed).
#
# For example:
# Given the string "([])[]({})", you should return true.
# Given the string "([)]" or "((()", you should return false.
#
# https://qoto.org/@Absinthe/103007264154461394
#
def brackets_balanced(test_str: str):
    open_brackets = '({['
    close_brackets = ')}]'
    expected_brackets = ''
    expected_close = ''
    for char in test_str:
        if (char in open_brackets):
            expected_close = close_brackets[open_brackets.index(char)]
            expected_brackets = expected_close + expected_brackets
        elif (char in close_brackets):
            if (char == expected_close):
                expected_brackets = expected_brackets[1:]
                expected_close = expected_brackets[0:1]
            else:
                # not valid
                break
    valid = (len(expected_brackets) == 0)
    return (valid)

test_strs = ['([])[]({})', '([)]', '((()']
for test_str in test_strs:
    print('test string:', test_str)
    print('result:', brackets_balanced(test_str))
