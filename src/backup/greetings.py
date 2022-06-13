import importlib.resources as pkg_resources
import resources as rs
from configparser import ConfigParser


def hello_world_english():
    return greeting(language="english")


def hello_world_spanish():
    return greeting(language="spanish")


def hello_world_italian():
    return greeting(language="italian")


def hello_world_portuguese():
    return greeting(language="portuguese")


def greeting(language: str):
    config_parser = ConfigParser()
    config = pkg_resources.read_text(rs, "greetings.cfg")
    config_parser.read_string(config)
    return config_parser.get(language, "greeting")
