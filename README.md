# dotfiles
minimal dot files for Linux setup.

Reminder:  
I use both Linux and Windows endpoints.  Passing files between them sometimes results in line ending issues: Linux "\n" vs. Windows "\r\n"  

The following idiom is handy sometimes for dealing with this intermittent problem:  
```bash
important_variable=$(<$CONTENT_HOME/content/.content_version)
important_variable=${important_variable%$'\r'}  # remove Windows carriage return, if it exists

```
Thank you: https://github.com/hacl-star/hacl-star/blob/main/tools/get_vale.sh  


