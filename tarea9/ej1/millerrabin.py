#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import logging
from random import randint
from sys import argv

logging.basicConfig(level=logging.DEBUG, format="%(name)s: %(message)s")
logger = logging.getLogger("miller-rabin")


def expmod(base: int, exp: int, mod: int) -> int:
    """Computes base^exp mod mod"""
    X = base
    E = exp
    Y = 1

    while E > 0:
        if E % 2 == 0:
            X = (X * X) % mod
            E //= 2
        else:
            Y = (X * Y) % mod
            E -= 1
    return Y


def btest(a: int, n: int) -> bool:
    s = 1
    t = (n - 1) // 2

    logger.debug(f"{t=}")
    while t % 2 != 1:
        s += 1
        t = t // 2
        logger.debug(f"{t=}")
    logger.debug(f"{s=}")

    x = expmod(a, t, n)
    logger.debug(f"expmod({a}, {t}, {n}) = {x}")
    if x == 1 or x == n - 1:
        return True

    for _ in range(1, s):
        x = (x * x) % n
        logger.debug(f"{x=}")
        if x == n - 1:
            return True

    return False


def miller_rabin(n: int) -> bool:
    a = randint(2, n - 2)
    logger.debug(f"random a: {a}")

    res = btest(a, n)
    logger.debug(f"btest({a}, {n}) = {res}")
    return res


def miller_rabin_repeated(n: int, k: int) -> bool:
    for i in range(k):
        if not miller_rabin(n):
            logger.debug(f"{i + 1} iteration(s)")
            return False

    logger.debug(f"{k} iteration(s)")
    return True


def main():
    c = int(argv[1])
    c *= 100000010000001

    # Uncomment to disable logging
    # logger.setLevel(logging.CRITICAL)
    res = miller_rabin_repeated(c, 10)
    print(f"{c} is {'prime' if res else 'composite'}")


if __name__ == "__main__":
    main()
