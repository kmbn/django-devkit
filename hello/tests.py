from django.test import Client, TestCase


class HelloTests(TestCase):
    def setUp(self):
        # Set up data for the whole TestCase
        self.client = Client()
        self.response = self.client.get("/")

    def test_status_code(self):
        assert self.response.status_code == 200

    def test_hello_world(self):
        assert self.response.content == b"Hello, World!"
