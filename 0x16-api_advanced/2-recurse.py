#!/usr/bin/python3

"""
queries the Reddit API and returns a list containing the titles
of all hot articles for a given subreddit
"""
import requests


def recurse(subreddit, hot_list=[]):
    """call the api recursively"""

    url = "https://www.reddit.com/r/{}/hot.json?limit=50".format(subreddit)
    headers = {"User-Agent": 'My agent'}
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 200:
        posts = response.json()

        for post in posts['data']['children']:
            hot_list.append(post['data']['title'])

        if posts['data']['after'] is not None:
            recurse(subreddit, hot_list=hot_list)
        return hot_list
    else:
        return None
