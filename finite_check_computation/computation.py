def run(input_data, target):
    import math
    limit = target.get('limit', 10**7)
    expected = set(target.get('expected', [1, 2, 145, 40585]))
    fact = [math.factorial(d) for d in range(10)]
    factorions = []
    for n in range(1, limit):
        s = 0
        tmp = n
        while tmp:
            s += fact[tmp % 10]
            tmp //= 10
        if s == n:
            factorions.append(n)
    found_set = set(factorions)
    sufficient = found_set == expected
    return {
        'evidence': factorions,
        'sufficient': sufficient,
        'summary': f'Found factorions up to {limit}: {factorions}. Match expected {sorted(expected)}: {sufficient}.',
        'records': [{'n': n, 'is_factorion': True} for n in factorions]
    }
