In case I'm not the only one who's irritated with youtube's usability lately,
this is a simple script I've thrown together to deal with links to music on youtube.

All the heavy lifting is done by the prerequisites:

* ruby        http://www.ruby-lang.org/
* youtube-dl  https://github.com/rg3/youtube-dl
* ffmpeg      http://www.ffmpeg.org/
* mplayer     http://www.mplayerhq.hu/
* kdialog     Part of kde-base, often packaged alone. http://www.kde.org/

Each of these has dependencies too... I recommend using your package manager
for all but youtube-dl itself.

Since you're using KDE, set up klipper as follows:

* Make sure 'enable clipboard actions' is set
* Go to 'configure klipper', make a new action:
* Set the regexp to "http://www.youtube.com/watch\?v=.+" (without the quotes)
* Give it a description of "Youtube link"
* Edit the action:
* Set the command to "get-youtube.rb %s" (again without quotes)
* Output handling should be 'ignore'
* Set the description to "Play Youtube Music"

Now, when you copy a youtube link, you'll be presented with a menu of things
you'd like to do with the link, including "Play Youtube Music"

Alternatively, you can just run it from your command-line, but if you're
copying the URL in order to do that anyway, you might as well just use klipper.

DISCLAIMER: Use at your own risk. I'm not responsible for any consequences that
may result from running this software.  Bad music, Google's banhammer, the
copyright people, and other problems are explicitly *not* the result of my
having written this software.  (This isn't unusual, see your favorite software
license.  I'm just underlining the point.)

© 2013 Chris Riddoch.  See COPYING for terms

