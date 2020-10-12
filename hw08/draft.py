def longest_in_seq(lst):
    # [1 2 3 4 9 3 4 1 10 5] --> [1 2 3 4 9 10]
    if not len(lst):
        return 0
    elif lst[0] < lst[1]:
        return 1 + longest_in_seq(lst[1:])
    else:
        return longest_in_seq(lst[1:])
