import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry
import json
import re


class Creator:

    def __init__(self):
        self.session = self._create_session()
        self.base_url = 'http://127.0.0.1:8900'

    def _create_session(self, retries=3):
        session = requests.Session()
        retry = Retry(
            total=retries,
            read=retries,
            connect=retries,
            backoff_factor=0.3,
            status_forcelist=(500, 502, 504)
        )
        adapter = HTTPAdapter(max_retries=retry)
        session.mount('http://', adapter)
        session.mount('https://', adapter)
        return session

    def create_user(self, name, email):
        url = self.base_url + '/user'
        headers = {'Content-Type': 'application/json'}
        data = {
          "email": email,
          "name": name
        }
        return self.session.post(url, headers=headers, data=json.dumps(data))

    def is_valid_id(self, email, id):
        regex = "^" + email + "-0\.\d{10}\d+$"
        return bool(re.match(regex, id))

    def get_user_id_by(self, email):
        r = self.session.get(f'{self.base_url}/user/all')
        for user in r.json():
            if user['email'] == email:
                return user['id']
        raise UserNotFound

    def create_booking(self, booking):
        user_id, date, from_IATA, to_IATA = booking
        headers = {'Content-Type': 'application/json'}
        data = {
            "date": date,
            "destination": to_IATA,
            "id": user_id,
            "origin": from_IATA
        }
        return self.session.post(f'{self.base_url}/booking', headers=headers, data=json.dumps(data))


class UserNotFound(Exception):
    """Raise an exception when the user isn't found"""
