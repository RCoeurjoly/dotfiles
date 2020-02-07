import sys
import string
import urllib2
if sys.version_info[0] == 3:
    from urllib.request import urlopen
else:
    # Not Python 3 - today, it is most likely to be Python 2
    # But note that this might need an update when Python 4
    # might be around one day
    from urllib import urlopen
import urllib
import requests
from urllib2 import urlopen

record=open("/home/rcl/Documents/Scripts/BooksNames.txt","r")
for line in record:
    bookName = line.split("/")[1].split(".")[0]
    link = "http://www.haodoo.net/?M=d&P=" + bookName + ".epub"
    try:
        f = requests.get(link)
    except requests.exceptions.ConnectionError:
        f.status_code = "Connection refused"
    urllib.urlretrieve(
        link,
        "/home/rcl/Documents/Books/" + bookName + ".epub")
    print (
        "Book " + bookName + ".epub found and downloaded.")
