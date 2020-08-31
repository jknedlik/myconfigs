c.backend = 'webengine'
c.fonts.default_size = "20px"
config.bind(',p', 'spawn --userscript qute-pass --dmenu-invocation dmenu')
config.bind(',P', 'spawn --userscript qute-pass --dmenu-invocation dmenu --password-only')
config.bind('<Ctrl-Shift-y>','hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(",n", "config-cycle content.user_stylesheets /home/jknedlik/.config/qutebrowser/solarized-all-sites-dark.css \"\"")
config.bind(';m', 'hint links spawn mpv {hint-url}')
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!a':       'https://www.amazon.com/s?k={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!dd':      'https://thefreedictionary.com/{}',
    '!e':       'https://www.ebay.com/sch/i.html?_nkw={}',
    '!fb':      'https://www.facebook.com/s.php?q={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gist':    'https://gist.github.com/search?q={}',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!gn':      'https://news.google.com/search?q={}',
    '!ig':      'https://www.instagram.com/explore/tags/{}',
    '!m':       'https://www.google.com/maps/search/{}',
    '!p':       'https://pry.sh/{}',
    '!r':       'https://www.reddit.com/search?q={}',
    '!sd':      'https://slickdeals.net/newsearch.php?q={}&searcharea=deals&searchin=first',
    '!t':       'https://www.thesaurus.com/browse/{}',
    '!tw':      'https://twitter.com/search?q={}',
    '!w':       'https://en.wikipedia.org/wiki/{}',
    '!yelp':    'https://www.yelp.com/search?find_desc={}',
    '!yt':      'https://www.youtube.com/results?search_query={}'
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
