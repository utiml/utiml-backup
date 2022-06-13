import sys
from backup.greetings import (
    hello_world_english,
    hello_world_spanish,
    hello_world_italian,
    hello_world_portuguese,
)


def main():
    print(hello_world_english())
    print(hello_world_spanish())
    print(hello_world_italian())
    print(hello_world_portuguese())


if __name__ == '__main__':
    sys.exit(main())
