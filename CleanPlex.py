import os, datetime
from plexapi.server import PlexServer
plex = PlexServer()

keep = []
kept=0
deleted=0

print '-----------------------------------------------'
print 'Running Plex Cleaner on '+datetime.datetime.now().strftime('%m/%d/%Y %H:%M:%S')
print ''

for entry in plex.library.section('TV Shows').recentlyViewed():
    if entry.grandparentTitle not in keep:
        print 'Deleting '+entry.title+' '+entry.media[0].parts[0].file
        deleted += 1
        os.remove(entry.media[0].parts[0].file)

    else:
        print 'Keeping '+entry.title+' '+entry.media[0].parts[0].file
        kept += 1

print ''
print str(kept) + ' Episodes Kept'
print str(deleted) + ' Episodes Deleted'
