import requests 
from bs4 import BeautifulSoup
import pandas as pd



url="https://www.iplt20.com/auction/2022"
r=requests.get(url)
# print(r)


soup=BeautifulSoup(r.text,"lxml")
# print(soup)


table=soup.find("table",class_="ih-td-tab w-100 auction-tbl")
# print(table)
# title=soup.find_all("th")
title=table.find_all("th")
# print(title)

header=[]
for i in title:
    name=i.text
    header.append(name)

# print(header)

df=pd.DataFrame(columns=header)
# print(df)


rows=table.find_all("tr")
# print(row)


for i in rows[1:]:
    first_td_div = i.find_all("td")[0].find("div", class_="ip-pt-ic")
    first_td = first_td_div.text.strip().replace("\n", "") if first_td_div else "N/A"
    data = i.find_all("td")[1:]
    row = [tr.text.strip().replace("\n", "") for tr in data]
    row.insert(0, first_td)
    df.loc[len(df)] = row



df.to_csv("IPL AUCTION STATS.csv")
