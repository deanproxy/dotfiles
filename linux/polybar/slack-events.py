#!/usr/bin/python -u

import dbus
from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GLib

count = 0
sender = ''

def filter(bus, msg):
    global count, sender

    args = msg.get_args_list()
    member = msg.get_member()

    if member == 'Notify' and args[0] == 'Slack':
        sender = msg.get_sender()
        count += 1
    else:
        destination = msg.get_destination()
        if sender == destination:
            count -= 1

    if count > 0:
        print(" ")
    else:
        print("")

if __name__ == "__main__":
    DBusGMainLoop(set_as_default=True)
    bus = dbus.SessionBus()

    notify_match = "interface='org.freedesktop.Notifications',member='Notify',eavesdrop='true'"
    closed_match = "interface='org.freedesktop.Notifications',member='NotificationClosed',eavesdrop='true'"
    bus.add_match_string(notify_match)
    bus.add_match_string(closed_match)
    bus.add_message_filter(filter)

    mainloop = GLib.MainLoop()
    mainloop.run()
