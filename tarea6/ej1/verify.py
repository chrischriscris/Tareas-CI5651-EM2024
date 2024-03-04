from sys import argv

def multiswap(A, a, b):
    i, j = a - 1, b - 1
    while i < b - 1 and j < len(A):
        A[i], A[j] = A[j], A[i]
        i += 1
        j += 1

def main():
    n = int(argv[1])
    A = list(range(1, n+1))
    multiswap(A, 120, 2500)
    print(" ".join(map(str, A)))

if __name__ == '__main__':
    main()

