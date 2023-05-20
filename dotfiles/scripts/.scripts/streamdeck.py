import os
import threading

from PIL import Image, ImageDraw, ImageFont
from StreamDeck.DeviceManager import DeviceManager
from StreamDeck.ImageHelpers import PILHelper
from collections import namedtuple
from subprocess import Popen, PIPE

# Folder location of image assets used by this example.
ASSETS_PATH = os.path.join(os.path.dirname(__file__), "icons")


deck = DeviceManager().enumerate()[0]


def run_bash(command):
    try:
        proc=Popen(command,stdout=PIPE,stderr=PIPE,shell=True)
        stdout,stderr=proc.communicate()
        print(stdout.decode(),stderr.decode())
    except BaseException as e:
        print(f"error in bash_command:{e.encode()}")

def generate_key(name,icon,font,func=False):
    return Key(name,icon,font,render_key_image(deck,icon,font,name),
               func if func else lambda: print(name))

def update_key_image(key_index):
    with deck: #thread acquire streamdeck
        deck.set_key_image(key_index,keys[key_index].image)

# Generates a custom tile with run-time generated text and custom image via the
# PIL module.
def render_key_image(deck, icon_filename, font_filename, label_text):
    # Resize the source image asset to best-fit the dimensions of a single key,
    # leaving a margin at the bottom so that we can draw the key title
    # afterwards.
    icon = Image.open(icon_filename)
    image = PILHelper.create_scaled_image(deck, icon, margins=[0, 0, 20, 0])

    # Load a custom TrueType font and use it to overlay the key index, draw key
    # label onto the image a few pixels from the bottom of the key.
    draw = ImageDraw.Draw(image)
    font = ImageFont.truetype(font_filename, 14)
    draw.text((image.width / 2, image.height - 5), text=label_text, font=font, anchor="ms", fill="white")

    return PILHelper.to_native_format(deck, image)


def exit():
    with deck: #scope for thread safe access
        print("Exit!")
        deck.reset()
        deck.close()

def key_change_callback(deck, key_index, state):
    #print("Deck {} Key {} = {}".format(deck.id(), key_index, state), flush=True)
    if state: #check if pressed
        keys[key_index].func()

old=[]
class Back:
    def func(self):
        global keys
        keys=old.pop()
        update_key_images()
    def __init__(self):
        self.keys   = keys
        self.name   = "back"
        self.icon   = f"{ASSETS_PATH}/Seraphine_Stage_Presence.png"
        self.font   = "FreeMono.otf"
        self.image  = render_key_image(deck,self.icon,self.font,self.name)

class Menu:
    def func(self):
        global keys
        old.append(keys)
        keys=self.list+[Back()]
        update_key_images()

    def __init__(self,name,icon,font,lst):
        self.list   = lst
        self.name   = name
        self.image  = render_key_image(deck,icon,font,name)

black=PILHelper.to_native_format(deck, Image.new("RGB", (200,200), (0)))
def fill_key_black(key_index):
    with deck: #thread acquire streamdeck
        deck.set_key_image(key_index,black)

def update_key_images():
    for i in range(6):
        if i<=len(keys)-1:
            update_key_image(i)
        else:
            fill_key_black(i)

##########################################################################################################
Key     =   namedtuple("Key",["name","icon","font",'image','func'])
icon    =   f"{ASSETS_PATH}/Seraphine_Stage_Presence.png"
font    =   "FreeMono.otf"
keys    =   [generate_key('switch outputs',icon,font,lambda:run_bash('./audiotogg.rb')),
             generate_key('switch inputs',icon,font,lambda:run_bash('./audiotogg.rb input')),
             generate_key('mumble',icon,font,lambda:run_bash('systemctl --user is-active lewhite && systemctl --user stop lewhite || systemctl --user start lewhite')),
             generate_key('swapusb2',icon,font,lambda:run_bash('./swapusb')),
             Menu("music",icon,font,[
                generate_key(' outxx',icon,font,lambda:run_bash('./audiotogg.rb')),
                generate_key(' inputs',icon,font,lambda:run_bash('./audiotogg.rb input'))]),
             generate_key('Exit',icon,font,exit)]

if __name__ == "__main__":
    try:
        deck.open()
        deck.set_brightness(80)
        update_key_images()

        # Register callback function for when a key state changes.
        deck.set_key_callback(key_change_callback)

        #close until all threads terminated by deck.close()
        for t in threading.enumerate():
            try:
                t.join()
            except RuntimeError:
                pass
    except BaseException as e:
        print(f"Exception: {e}")
        pass
    finally:
        with deck:
            deck.close()


