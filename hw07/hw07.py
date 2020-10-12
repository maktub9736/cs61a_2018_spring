
passphrase = '52c89952'

def survey(p):
    """
    You do not need to understand this code.
    >>> survey(passphrase)
    '97e452c59a442b883101399ae62ce6cb4bac08f3d1c84cbbb365504d'
    """
    import hashlib
    return hashlib.sha224(p.encode('utf-8')).hexdigest()


def empty(s):
    return s is Link.empty

def contains(s, v):
    if empty(s):
        return False
    elif s.first > v:
        return False
    elif s.first == v:
        return True
    else:
        return contains(s.rest, v)

def intersect(set1, set2):
    if empty(set1) or empty(set2):
        return Link.empty
    else:
        e1, e2 = set1.first, set2.first
    if e1 == e2:
        return Link(e1, intersect(set1.rest, set2.rest))
    elif e1 < e2:
        return intersect(set1.rest, set2)
    elif e2 < e1:
        return intersect(set1, set2.rest)

def union(set1, set2):
    if empty(set1):
        return set2
    elif empty(set2):
        return set1
    else:
        e1, e2 = set1.first, set1.first
        if e1 == e2:
            return Link(e1, union(set1.rest, set2.rest))
        elif e1 < e2:
            return Link(e1, union(set1.rest, set2))
        elif e1 > e2:
            return Link(e2, union(set1, set2.rest))
