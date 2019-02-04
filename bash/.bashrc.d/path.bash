# pathmunge () {
#   if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
#     if [ "$2" = "after" ] ; then
#       PATH=$PATH:$1
#     else
#       PATH=$1:$PATH
#     fi
#   fi
# }


# pathmunge /usr/local/heroku/bin
# pathmunge /usr/lib/mutt
# pathmunge /usr/local/sbin after
# pathmunge /usr/bin after
# pathmunge /usr/local/bin/ after
PATH=$PATH:/usr/bin:/usr/local/bin/:/usr/local/sbin

export PATH
