# How to install waydroid on Fedora
This turorial is for Fedora with weston (if you have the default GNOME you should be good)

I will mark steps with **VM**, if want to do it on virtual machine and steps with **NOT-VM** if it is not common step and people with **VM** wouldnt need to do it. 


# VM-1) Install virtual box
I had many issues with my own Fedora e.g. the desktop environment needs to be wayland, x11 is not supported (you need to do some workaround) and for me was simpler to get VM where I would do there all the neccesary changes.

1) Here install the virtual box: https://www.oracle.com/cz/virtualization/technologies/vm/downloads/virtualbox-downloads.html

After installing the rpm file, go the location where the rpm file was downloaded and run this:

```
sudo dnf install YOUR_APP_NAME.rpm
```
2) In case you want Fedora 40, here install the iso image "Fedora-Workstation-Live-x86_64-40-1.14.iso" from https://mirror.arizona.edu/fedora/linux/releases/40/Workstation/x86_64/iso/



# VM-2) Create the virtual machine
I followed this video (from the specified time lapse) to create the virtual machine: https://youtu.be/wa8VFTcb2aY?t=177

# 3) Install waydroid
For the install, I followed the documentation https://docs.waydro.id

1) Install waydroid https://docs.waydro.id/usage/install-on-desktops:
```
sudo dnf install waydroid
```

**NOT-VM-1**) Not able to open/start waydroid
The fix for the issue is here: https://github.com/waydroid/waydroid/issues/493
> Fix: in /var/lib/waydroid/lxc/waydroid/config comment out: lxc.apparmor.profile = unconfined.
**Be aware** that even though you did it once, you might need to do it again, as with some updates, your changes to the config can be undone 

2) Open waydroid (by searching it in your apps) and paste these URLs in the OTA fields:

System OTA: https://ota.waydro.id/system

Vendor OTA: https://ota.waydro.id/vendor

and choose as Android type choose GAPPS if you want to install apps from Google Play Store:

![image](https://github.com/user-attachments/assets/84e492c3-61a2-41ad-81ad-0aebf676a47c)

**VM-3**) If we are on virtual machine, we need to do this step: https://docs.waydro.id/faq/google-play-certification

3) If you chose GAPPS
you have to self certify for Google Play, follow steps here: https://docs.waydro.id/faq/google-play-certification

4) Extra step
After following all these steps, waydroid should be ready to use but you might get problem with installing some apps, e.g.:
![image](https://github.com/user-attachments/assets/c8b313ef-ea94-4630-9c67-d42d0aca634d)

I found the cause of issue "This tablet isn't compatible with this app" in reddit comment: https://www.reddit.com/r/waydroid/comments/14hjfzq/way_droid_dont_have_compatible_devices_can_i_fix/

> install Libhoudini ARM emulation. Some apps won't work because they run on ARM architecture and not x86_64 architecture.
>
> https://github.com/casualsnek/waydroid_script
>
> this link is also in the Waydroid documentation with some other good ones.

Instead of using casualsnek/waydroid_script, I preferred to use https://github.com/ayasa520/waydroid-helper (that I installed in one of my attepmts, no other reason)

There to make it run ARM applications, I installed the four packages (not sure if all needed), click show and then install:

![image](https://github.com/user-attachments/assets/4b7d59c9-9136-456a-9032-0929010c5da2)


Everything should be working now, enjoy :D

