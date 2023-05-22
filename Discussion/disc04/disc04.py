def count_k(n, k):
    """
    >>> count_k(3, 3) # 3, 2 + 1, 1 + 2, 1 + 1 + 1
    4
    >>> count_k(4, 4)
    8
    >>> count_k(10, 3)
    274
    >>> count_k(300, 1) # Only one step at a time
    1
    """
    if (n == 0): return 1
    if (n < 0): return 0
    if (n < k): return count_k(n, n)
    return sum([count_k(n - i, k) for i in range(1, k+1)])


def max_product(s):
    """Return the maximum product that can be formed using non-consecutive
    elements of s.
    >>> max_product([10,3,1,9,2]) # 10 * 9
    90
    >>> max_product([5,10,5,10,5]) # 5 * 5 * 5
    125
    >>> max_product([])
    1
    """
    if not s: return 1
    if len(s) == 1: return s[0]
    return max(s[0] * max_product(s[2:]), max_product(s[1:]))

