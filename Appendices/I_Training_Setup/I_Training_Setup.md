---
title:  "Appendix I"
author: "ormgpmd"
date:   "20220201"
output: html_document
knit:   (
            function(input_file, encoding) {
                out_dir <- '';
                rmarkdown::render(
                    input_file,
                    encoding=encoding,
                    output_file=file.path(dirname(input_file), out_dir,
                    'I_Training_Setup.html')
                )
            }
        )
---

## Appendix I - Training Setup and Access

The previous setup relied upon the use of dedicated partner machines to which
users could connect using remote-desktop.  Now an alternative methodology,
based upon Citrix XenDesktop, is used to access a pool of partner machines
(generally up to a ten computers at-a-time) through a web browser (see
Appendix I.1).  In
addition, a web-based application is available through the [ORMGP
website](www.oakridgeswater.ca) which allows the user to access a subset of
the database along with a variety of spatial data sources through Geocortex (see Appendix I.2).

### Appendix I.1 - Citrix Xendesktop

Using one of the following browsers:

* *Google Chrome (incognito mode)*
* *Mozilla Firefox (private window)*

navigate to the site

[xendesktop.oakridgeswater.ca](https://xendesktop.oakridgeswater.ca)

where you will be prompted with the 'Citrix NetScalar Gateway' welcome/login window.  Login with your domain user name and password:

User name: \<user name\>
Password: \<user password\>

You may be asked to choose the type of client to use at this point.  The 'Light' client works directly in your browser; the other requires the installation of the Citrix Client software on your local machine.  This would likely only happen the first time at connection is attempted.  You should then be directly forwarded to a partner computer.  Alternatively, you could be prompted with a welcome screen - in this case, select 'Desktops' and then 'ORMGP Partners Pooled'.  A new window/tab should pop up (you may need to enable pop-up windows - you should be prompted if this occurs) which is then connected to a partner computer.  

Note that if you need to set or reset the connection type (i.e. 'Light' or 'Client') during any subsequent use, this can be accomplished by selecting 'Account Settings' from the drop-down box in the upper right of the welcome screen.  Select 'Change Citrix Receiver' and the select 'Light'.

Note that the partner machines have been updated to Windows 10 so the interface will differ from any previous experience.  In addition, the updated Citrix environment includes security enhancements which may prevent access to the usual 'Start' menu; some functionality can be accessed by 'right-clicking' on the 'Start' menu instead.  Also, it seems at times to take approximately ten minutes for the operating system image to be completely ready for use.  During this time the error 'Image Invalid' may come up when starting a program (e.g. SiteFX).

There are presently ten machines configured - users will be assigned to a random machine each time they login.  To maintain files between logins make sure to place/copy all files under 'Documents' - this is a permanent location tied to your login information.

In the Citrix environment, a toolbar is present (either at the top- or right-side of the window) that allows you to (at least) 'Upload' or 'Download' files or send a 'Ctrl-Alt-Del' to the window (necessary, at times, to login).

When finished, select 'Start - Sign Out' ('right-clicking' will allow you to access the logout option as well) which will logoff and shutdown the machine you were using and place you back at the welcome screen.  You can logoff from here by selecting 'Log Off' under the drop-down menu in the upper-right.

Please test the environment, noting and reporting any problems or errors that are found.

### Appendix I.2 - Geocortex Mapping Portal(s)

Examining the [ORMGP webpage](www.oakridgeswater.ca), users will note that
there is a 'MAPS' and 'SIGN IN' link.  The former is publicly accessible and
contains only a small portion of the information available through the latter.
The **SIGN IN**, however, requires an ORMGP provided user login and password.


