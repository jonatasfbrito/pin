import re
import requests


def find_video(html):
    padrao_regex = r'https://v1\.pinimg\.com/videos/.*\.mp4'
    urls_encontradas = re.findall(padrao_regex, html)
    if "contentUrl" in urls_encontradas[-1]:
        response = urls_encontradas[-1].split('contentUrl":"')[1]
    else:
        response = urls_encontradas[-1]
    return response

link = input("Link: ")
html = requests.get(link).text
result = find_video(html)
print(result)
