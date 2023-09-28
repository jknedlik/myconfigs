config.load_autoconfig()
c.backend = 'webengine'
c.fonts.default_size = "20px"
c.editor.command = ["alacritty","-e","sh","-c","sleep 0.1 && vim {}"]
c.bindings.commands["normal"]={
'gp':  'set content.proxy "socks5://localhost:8787"',
',gp': 'set content.proxy ""',
'e': 'edit-text',
'E': 'edit-text ;; later 1000 fake-key <Ctrl-Enter>',
',p': 'spawn --userscript qute-pass --dmenu-invocation dmenu ',
',P': 'spawn --userscript qute-pass --dmenu-invocation dmenu --password-only',
'<Ctrl-Shift-y>':'hint links spawn --detach mpv --force-window yes {hint-url}',
';m': 'hint links spawn mpv {hint-url}'}
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.de/s?k={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!wiki':       'https://en.wikipedia.org/wiki/{}',
    '!y':      'https://www.youtube.com/results?search_query={}'
}
c.tabs.position = "right"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.page= "always"
#
c.colors.statusbar.normal.bg="#121212"
c.colors.statusbar.normal.fg="#0999d9"
#search menu color
c.colors.completion.match.fg="#f5870a"
c.colors.completion.category.bg="#121212"
c.colors.completion.category.fg="#f5870a"
c.colors.completion.even.bg="#121212"
c.colors.completion.fg="#c500d1"
c.colors.completion.odd.bg="#202020"
c.colors.completion.category.border.top ="#121212"
c.colors.completion.category.border.bottom="#121212"

#bar color
c.colors.tabs.bar.bg="#121212"
#unselected tab color
c.colors.tabs.odd.bg="#121212"
c.colors.tabs.odd.fg="#c500d1"
c.colors.tabs.even.bg="#202020"
c.colors.tabs.even.fg="#0999d9"
#selected tab color
c.colors.tabs.selected.odd.bg="#121212"
c.colors.tabs.selected.even.bg="#202020"
c.colors.tabs.selected.odd.fg="#f5870a"
c.colors.tabs.selected.even.fg="#f5870a"
#do not flash pages white before css is loaded
c.colors.webpage.bg="#121212"
c.colors.tabs.even.bg="#202020"
c.colors.hints.bg="#121212"
c.colors.hints.fg="#f5870a"
c.colors.contextmenu.menu.bg="#121212"

# adblock settings
c.content.blocking.method="both"
c.content.blocking.adblock.lists=[
  "https://easylist.to/easylist/easylist.txt",
  "https://easylist.to/easylist/easyprivacy.txt",
  "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext",
  "https://curben.gitlab.io/malware-filter/urlhaus-filter-online.txt",
  "https://gitcdn.xyz/repo/NanoAdblocker/NanoFilters/master/NanoMirror/NanoDefender.txt",
  "https://gitcdn.xyz/repo/NanoAdblocker/NanoFilters/master/NanoFilters/NanoBase.txt"
   "https://easylist.to/easylistgermany/easylistgermany.txt"
]
