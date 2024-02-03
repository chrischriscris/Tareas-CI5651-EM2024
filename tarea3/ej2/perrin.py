# Calculates the Perrin numbers using an iterative approach

def perrin(n):
    a, b, c = 3, 0, 2
    if n == 0:
        return a
    if n == 1:
        return b
    if n == 2:
        return c

    for _ in range(2, n):
        a, b, c = b, c, a + b
    return c

def matmult(A, B):
    return [[sum(a * b for a, b in zip(A_row, B_col)) for B_col in zip(*B)] for A_row in A]

def matpow(M, n):
    result = [[1, 0], [0, 1]]
    while n > 0:
        if n % 2 == 1:
            result = matmult(result, M)
        n //= 2
        M = matmult(M, M)
    return result

def perrin_mat(n):
    if n == 0:
        return 3
    if n == 1:
        return 0
    if n == 2:
        return 2

    P = [[0, 1, 1], [1, 0, 0], [0, 1, 0]]
    P = matpow(P, n - 2)

    return 2*P[0][0] + 3*P[0][2]

# Receive input from argv
if __name__ == "__main__":
    from sys import argv
    from sys import set_int_max_str_digits

    set_int_max_str_digits(1000000)

    # print(perrin(int(argv[1])))
    print(perrin_mat(int(argv[1])))
