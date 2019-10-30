from __future__ import print_function

import pandas as pd
import geoip2.database

import sys

def import_csv():
    IPUID = pd.read_csv("ip_user.csv")
    #IPUID['user_id'] = IPUID['user_id'].str.extract('(\d+)', expand=False)
    return IPUID

def IP_CALC(IPUID):
    #calculate IP Geolocation
    reader = geoip2.database.Reader('GEOLITE2-City.mmdb')
    max_index = IPUID.index.max()
    
    for index in IPUID.index: #Loop for each row on results
        
        try:
            response = reader.city(IPUID.at[index, 'ip'])
            country = response.country.iso_code
            name = response.country.name
            subdiv = response.subdivisions.most_specific.name
            city = response.city.name
            postcode = response.postal.code
            lon = response.location.longitude
            lat = response.location.latitude
        except:
            country = ''
            name = ''
            subdiv = ''
            city = ''
            postcode = 0
            lon = 0
            lat = 0

        IPUID.at[index, 'ip_country_iso'] = country
        IPUID.at[index, 'ip_country_name'] = name
        IPUID.at[index, 'ip_subdivision_name'] = subdiv
        IPUID.at[index, 'ip_city_name'] = city
        IPUID.at[index, 'ip_postal_code'] = postcode
        IPUID.at[index, 'ip_longitude'] = lon
        IPUID.at[index, 'ip_latitude'] = lat
        
        printProgressBar(index, max_index)
        
    reader.close()
    return IPUID

def printProgressBar (iteration, total):
    percent = ("{0:.1f}").format(100 * (iteration / float(total)))
    print ('\r %s%%' % (percent), end = '\r')
    
    if iteration == total: 
        print()

if __name__=="__main__":
    IPUID = import_csv()
    IPUID = IP_CALC(IPUID)
    IPUID.to_csv(path_or_buf='ip_user_final.csv', index=False, encoding='utf-8', doublequote=False, escapechar='\\')
