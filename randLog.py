#!bin/bash/env python3
import logging
import logging.handlers
import random

# Create logger and set level
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# Create a file and handler
fileName = "logdog.txt"
handler = logging.handlers.RotatingFileHandler(fileName, maxBytes=50, backupCount=10)

# Inject a random number into file until the file reaches 50 bytes in size
# Create a max of 10 backup files
randNum = random.randrange(1, 500)
logger.addHandler(handler)
logger.info(randNum)