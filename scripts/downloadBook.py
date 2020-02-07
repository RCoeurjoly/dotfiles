import urllib
import sys
import requests
# import string
# import urllib2
if sys.version_info[0] == 3:
    from urllib.request import urlopen
    # Not Python 3 - today, it is most likely to be Python 2
    # But note that this might need an update when Python 4
    # might be around one day
    # from urllib import urlopen

# from urllib2 import urlopen

letter_UpperCase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
numbersAndLetters = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
                     'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
                     'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
                     'V', 'W', 'X', 'Y', 'Z']
letter_LowerCase = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
                    't', 'u', 'v', 'w', 'x', 'y', 'z']
# We begin to search for books uploaded before the year 2011
# These follow the notation: number+[lower case letter(for book series)]
record = open("/home/rcl/Documents/Haodoo17Jun/record.txt", "w")
'''for i in range(1, 580):
    for letter_download in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']:
        # print ("Entrando en el bucle de los primeros libros 580")
        link = (
            "http://www.haodoo.net/?M=d&P="
            + str(letter_download) + str(i) + ".epub"
        )
        try:
            f = requests.get(link)
        except requests.exceptions.ConnectionError:
            f.status_code = "Connection refused"
        if len(f.text) == 0:
            print(
                'Book ' + letter_download + str(i) + ' does not exist')
            for letter_series in letter_LowerCase:
                # print ("Entrando en el bucle de"
                # + "las series de los primeros libros 580")
                # Checking if there is a series
                # (finished by a lower case letter)
                link_series = (
                    "http://www.haodoo.net/?M=d&P="
                    + letter_download + str(i) + letter_series + ".epub"
                )
                try:
                    f_series = requests.get(link_series)
                except requests.exceptions.ConnectionError:
                    f_series.status_code = "Connection refused"
                if len(f_series.text) == 0:
                    print(
                        'Book '
                        + letter_download + str(i) + letter_series
                        + ' does not exist. So there no series')
                    break
                else:
                    urllib.urlretrieve(
                        link_series,
                        "/home/rcl/Documents/Books/"
                        + letter_download + str(i) + letter_series + ".epub")
                    record.write(letter_download
                                 + str(i) + letter_series + "\n")
                    print (
                        "Series book "
                        + letter_download + str(i) + letter_series
                        + ".epub found and downloaded."
                        + "Looking for more books in the series")
        else:
            urllib.urlretrieve(
                link,
                "/home/rcl/Documents/Books/"
                + letter_download + str(i) + ".epub")
            record.write(letter_download + str(i) + "\n")
            print (
                "Book "
                + letter_download + str(i)
                + ".epub found and downloaded.")
            break
# We begin to search for books that were uploaded from 2011 onwards
# Those books have the following structure:
# year+(number or upper case letter)+number+[lower case letter
# (for series)]
'''
for year in range(7, 10):
    for numberOrLetter in numbersAndLetters:
        for number in range(0, 10):
            for letter_download in ['I']:
                # print ("Bucle de los libros clasificados por anos")
                link = (
                    "http://www.haodoo.net/?M=d&P=0"
                    + letter_download + str(year)
                    + str(numberOrLetter) + str(number) + ".epub"
                )
                try:
                    f = requests.get(link)
                except requests.exceptions.ConnectionError:
                    f.status_code = "Connection refused"
                if len(f.text) == 0:
                    print(
                        'Book '
                        + letter_download + str(year)
                        + str(numberOrLetter)
                        + str(number) + ' does not exist')
                    record.write(letter_download
                                 + str(year)
                                 + str(numberOrLetter)
                                 + str(number) + "\n")
                    for letter_series in letter_LowerCase:
                        # print ("Bucle libros clasificados por anos (Series)")
                        # Checking if there is a series
                        # (finished by a lower case letter)
                        link_series = (
                            "http://www.haodoo.net/?M=d&P="
                            + letter_download + str(year)
                            + str(numberOrLetter)
                            + str(number)
                            + letter_series + ".epub"
                        )
                        try:
                            f_series = requests.get(link_series)
                        except requests.exceptions.ConnectionError:
                            f_series.status_code = "Connection refused"
                        if len(f_series.text) == 0:
                            print(
                                'Book ' + letter_download
                                + str(year)
                                + str(numberOrLetter)
                                + str(number) + letter_series
                                + ' does not exist.'
                                + ' So there is no series')
                            break
                        else:
                            urllib.urlretrieve(
                                link_series,
                                "/home/rcl/Documents/Books/"
                                + letter_download + str(year)
                                + str(numberOrLetter)
                                + str(number) + letter_series + ".epub")
                            record.write(letter_download
                                         + str(year)
                                         + str(numberOrLetter)
                                         + str(number)
                                         + letter_series + "\n")
                            print (
                                "Series book " + letter_download
                                + str(year) + str(numberOrLetter)
                                + str(number) + letter_series
                                + ".epub found and downloaded."
                                + "Looking for more " + "books in the series")
                else:
                    urllib.urlretrieve(
                        link,
                        "/home/rcl/Documents/Books/"
                        + letter_download + str(year)
                        + str(numberOrLetter) + str(number) + ".epub")
                    record.write(letter_download + str(year)
                                 + str(numberOrLetter)
                                 + str(number) + "\n")
                    print (
                        "Book " + letter_download
                        + str(year) + str(numberOrLetter)
                        + str(number) + ".epub found and downloaded.")
                    break
record.close()
