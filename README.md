## $5 Tech Unlocked 2021!
[Buy and download this Book for only $5 on PacktPub.com](https://www.packtpub.com/product/mastering-bash/9781784396879)
-----
*If you have read this book, please leave a review on [Amazon.com](https://www.amazon.com/gp/product/1784396877).     Potential readers can then use your unbiased opinion to help them make purchase decisions. Thank you. The $5 campaign         runs from __December 15th 2020__ to __January 13th 2021.__*

# Mastering Bash
This is the code repository for [Mastering Bash](https://www.packtpub.com/networking-and-servers/mastering-bash?utm_source=github&utm_medium=repository&utm_campaign=9781784396879), published by [Packt](https://www.packtpub.com/?utm_source=github). It contains all the supporting project files necessary to work through the book from start to finish.
## About the Book
System administration is an everyday effort that involves a lot of tedious tasks, and devious pits. Knowing your environment is the key to unleashing the most powerful solution that will make your life easy as an administrator, and show you the path to new heights. Bash is your Swiss army knife to set up your working or home environment as you want, when you want.


## Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter02.



The code will look like the following:
```
#!/bin/bash
set -x
echo "The total disk allocation for this system is: "
echo -e "\n"
df -h
echo -e "\n"
set +x
df -h | grep /dm-0 | awk '{print "Space left on root partition: " $4}'
```

This book assumes a good level of experience with Linux operating systems and an
intermediate knowledge of the Bash shell, and since there will be some chapters dealing
with Nagios monitoring and Slack messaging, basic understanding of networking concepts
is required.
A simple Linux installation is required with really low specifications, as even the Nagios
plugin can be tested without requiring the actual installation of the monitoring system. So,
this is the minimum configuration required:
CPU: single-core
Memory: 2 GB
Disk space: 20 GB
For this book, you will need the following software:
Linux operating system: Debian 8
Nagios Core 3.5.1
OpenSSH 6.7p1
rssh 2.3.4
Internet connectivity is required to install the necessary service packages and to try out
some of the examples.

## Related Products
* [Mastering PrimeFaces [Video]](https://www.packtpub.com/web-development/mastering-primefaces-video?utm_source=github&utm_medium=repository&utm_campaign=9781783988068)

* [Markdown Mastery [Video]](https://www.packtpub.com/web-development/markdown-mastery-video?utm_source=github&utm_medium=repository&utm_campaign=9781787128293)

* [Intel Edison Projects](https://www.packtpub.com/hardware-and-creative/intel-edison-projects?utm_source=github&utm_medium=repository&utm_campaign=9781787288409)

