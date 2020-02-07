import urllib
import requests
for i in range(1, 11000):
    link = "http://bibliothequenumerique.tv5monde.com/download/epub/"
    + str(i) + ".epub"
    try:
        f = requests.get(link)
    except requests.exceptions.ConnectionError:
        f.status_code = "Connection refused"
    if len(f.text) == 0:
        print(
            'Book ' + str(i) + ' does not exist')
    else:
        urllib.urlretrieve(
            link,
            "/home/rcl/Documents/Books/French/" + str(i) + ".epub")
        print (
            "Book " + str(i) + ".epub found and downloaded.")
