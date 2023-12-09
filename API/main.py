import random

from faker import Faker
from flask import Flask
from datetime import datetime, timedelta, date


SEED = 1234567890

random.seed(SEED)
Faker.seed(SEED)

fake = Faker()
app = Flask(__name__)


def get_names(min_n=1, max_n=3):
    names = []
    for i in range(random.choice(range(min_n, max_n + 1))):
        names.append(fake.name())
    
    return ", ".join(names)


def get_title(date_added):
    data = {
        "show_id": f"s{random.choice(range(1, 1000))}",
        "type": random.choice(["TV Show", "Movie"]),
        "title": fake.sentence(nb_words=5)[:-1],
        "director": get_names(),
        "cast": get_names(5, 10),
        "country": fake.country(),
        "date_added": date_added,
        "release_year": fake.year(),
        "rating": None,
        "duration": None
    }

    return data

@app.route('/titles/<date_added>')
def get_titles(date_added):
    try:
        date_added_obj = datetime.strptime(date_added, "%Y-%m-%d")
    except:
        return "INVALID DATE", 400
    
    now = datetime.now()
    if date_added_obj < now - timedelta(days=30) or date_added_obj > now:
        return []

    titles = []
    for i in range(random.choice(range(10))):
        titles.append(get_title(date_added))
        
    return titles
