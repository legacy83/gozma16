Gozma16
=======

Easily vagrant up ubuntu/xenial64 machines.


Included Software
-----------------

- Ubuntu 16.04
- Git
- PHP 7.0
- Apache
- MySQL
- Sqlite3
- PostgreSQL
- Composer
- Node (With Yarn, Bower, Grunt, and Gulp)
- MailHog
- mhsendmail
- Oh My ZSH!


Accessing Globally
------------------

Sometimes you may want to `vagrant up` your Gozma16 machine from anywhere on your filesystem. You can do this on Mac / Linux systems by adding a Bash function to your Bash profile. Here goes a nice sample:

```bash
gozma16() {
  if [ "destroy" == $1 ];
  then
    echo "Sorry, the '$1' command is not encouraged!"
    return 1
  fi

  ( cd /opt/vagrant-local/gozma16 && vagrant $* )
}
```

Make sure to tweak the `/opt/vagrant-local/gozma16` path in the function to the location of your actual Gozma16 installation. Once the function is installed, you may run commands like `gozma16 up` or `gozma16 ssh` from anywhere on your system.


The Hosts File
--------------

You must add the "domains" for your sites to the `hosts` file on your machine. The `hosts` file will redirect requests for your sites into your Gozma16 machine. On Mac and Linux, this file is located at `/etc/hosts`. The lines you add to this file will look like the following:

~~~
192.168.27.16 gozma16.local
~~~
