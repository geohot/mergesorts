
def mergesort(a):
    if len(a) == 1:
        return a
    elif len(a) == 2:
        return [a[1], a[0]] if a[0] > a[1] else a

    p = len(a)//2
    m1 = mergesort(a[:p])
    m2 = mergesort(a[p:])

    ret = []

    while True:
        if len(m1) > 0:
            if len(m2) > 0:
                ret.append(m1.pop(0) if m1[0] <= m2[0] else m2.pop(0))
            else:
                ret.extend(m1)
                m1 = []
        elif len(m2) > 0:
            ret.extend(m2)
            m2 = []
        else:
            break
    return ret

a = [5,9,1,3,4,6,6,3,2]
print(mergesort(a))
