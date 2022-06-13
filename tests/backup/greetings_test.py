from backup.greetings import (
    hello_world_english,
    hello_world_spanish,
    hello_world_italian,
    hello_world_portuguese,
)
from assertpy import assert_that


def test_hello_world_english():
    assert_that(hello_world_english()).is_equal_to("Hello World!")


def test_hello_world_spanish():
    assert_that(hello_world_spanish()).is_equal_to("Hola Mundo!")


def test_hello_world_italian():
    assert_that(hello_world_italian()).is_equal_to("Ciao Mondo!")


def test_hello_world_portuguese():
    assert_that(hello_world_portuguese()).is_equal_to("Olá Mundo!")

