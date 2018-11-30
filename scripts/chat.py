import sys

import twitch

twitch.Chat(channel=f'#{sys.argv[1]}', nickname='zarlach', oauth='oauth:zdi1eezbcumpq5o1ipp0wneks7zn3o').subscribe(
	lambda message: print(f'{message.sender}: {message.text}\n')
)
