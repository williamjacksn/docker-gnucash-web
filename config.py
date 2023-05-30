import logging
import os

AUTH_MECHANISM = None
DB_DRIVER = 'sqlite'
DB_NAME = os.getenv('DB')
LOG_LEVEL = logging.INFO
SECRET_KEY = os.getenv('SECRET_KEY')
TRANSACTION_PAGE_LENGTH = 25
