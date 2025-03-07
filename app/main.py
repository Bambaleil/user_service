MESSAGE = "hello world"


def foo() -> str:
    """Example function."""
    return MESSAGE


if __name__ == '__main__':
    message = foo()
    print(message)
