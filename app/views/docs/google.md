# Your Google Data

Google's products are used by billions of people.

In September 2009, Google announced the foundation of a new engineering team called the [Data Liberation Front](http://en.wikipedia.org/wiki/Google_Data_Liberation_Front). In 2011, they released [Google Takeout](https://www.google.com/settings/takeout), a single page from which you can export some of the data Google has collected about you.

## Download

![Google Takeout ](docs/google_takeout.png)

You can use [Google Takeout](https://www.google.com/settings/takeout) to download an archive of your Google data.

When you visit the page, you'll see a list of Google products, with controls to include or exclude them from your archive. Click *Next* at the bottom of the page.

![Google Takeout ](docs/google_takeout_create.png)

On the next page, you can choose the download format of your archive, and start the export process.

![Google Takeout Email ](docs/google_email.png)

Some time later, you'll receive an email from Google with a download link. It will also link to the [archive manager](https://www.google.com/settings/takeout/downloads), where you can redownload any data archives from the last week.

![Google Takeout Downloads ](docs/google_manage.png)

## What You Get

![Google Takeout Downloads ](docs/google_download.png)

My archive was split into 3 files:

*   All of my gmail content, in mbox format. This was by far my biggest archive, clocking in at 3.47 GB.
*   An index.html file, meant to be extracted into the same folder as the main archive and serve as a navigation aid.
*   The main archive, a folder called Takeout with (in my case) 17 subfolders each representing a Google product.

### The Main Archive

![Google Takeout Main Archive ](docs/google_files.png)

*   **Bookmarks**: contains my Google Maps bookmarks in an HTML definition list.
*   **Calendar**: contains an `ics` file for each of my Google Calendars.
*   **Contacts**: contains a vcard `vcf` export of each of my Google Contacts groups, plus one for All Contacts.
*   **Drive**: contains the files from my Google Drive. Just as regular files, nothing fancy.
*   **Google Code Project Hosting**: contains a JSON-formatted list of my Google Code projects.
*   **Google Photos**: contains folders for each of my Google photo albums. I don't knowingly use Google Photos, but apparently each hangout you post images into becomes a photo album behind the scenes.
*   **Google+ Circles**: contains vcard files for each of my Google Plus circles, the only metadata in the vcards is each person's name and Google Plus url.
*   **Google+ Pages**: contains a folder for each of my Google Plus pages. Each has a Circles folder, containing JSON data representing the page's followers, team members, and customers.
*   **Google+ Stream**: contains an html file for each post to my Google+ timeline
*   **Hangouts**: contains an enormous JSON file representing my Google Hangouts (formerly Google Talk conversations).
*   **Location History**: contains a JSON file which I think would contain my phone's location history if I were an Android user.
*   **Maps (your places)**: contains a JSON file with my saved Google Maps locations.
*   **Messenger**: contains an empty JSON file. I think it's an Android thing.
*   **Profile**: contains a JSON file with my Google+ Profile information.
*   **Tasks**: contains a JSON file with my Google Tasks.
*   **Voice**: contains information from my Google Voice account, split into folders for Calls and Greetings, plus a vcard file with my own phones in it.
*   **YouTube**: contains html and JSON formatted info, plus raw video files for all my YouTube uploads.






