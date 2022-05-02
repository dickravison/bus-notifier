import requests
import os
import datetime
from bs4 import BeautifulSoup

def telegram_bot_sendtext(bot_message):

    bot_token = os.environ['TELEGRAM_TOKEN']
    bot_chatID = os.environ['TELEGRAM_CHAT_ID']
    send_text = 'https://api.telegram.org/bot' + bot_token + '/sendMessage?chat_id=' + bot_chatID + '&parse_mode=Markdown&text=' + bot_message

    response = requests.get(send_text)

    return response.json()

def scrape(event, context):
    url=''
    currenttime = datetime.datetime.now().time()
    endtime = datetime.time(12, 0, 0)
    if currenttime < endtime:
        url = os.environ['HOMETOWORK']
    else:
        url = os.environ['WORKTOHOME']

    page = requests.get(url)
    soup = BeautifulSoup(page.content, 'html.parser')
    stop = soup.body.find('h2', attrs={'class': 'grid__item one-half'}).text
    departures = soup.body.find_all('td', attrs={'class': 'departure-expected'})
    message='Next bus departures from ' + stop + ' are: \n\n'
    for x in departures:
        figure = x.find('span', attrs={'class': 'figure'}).text
        if ':' not in figure:
            message += figure + " mins \n"
        else:
            message += figure +"\n"
    print(message)
    telegram_bot_sendtext(message)
