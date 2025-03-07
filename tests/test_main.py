import pytest

from app.main import foo


@pytest.fixture
def setup_data():
    return "hello world"


def test_foo(setup_data):
    """Test function."""
    result = foo()
    assert result == setup_data


def test_foo_length():
    result = foo()
    assert len(result) == 11


def test_foo_only_str():
    result = foo()
    assert isinstance(result, str)
