
# Vagrant VM

Vagrant VM definition for my own usage.

This is just a bunch of configuration files and `Vagrantfile` that are used for my own benefit.

The provisioner used is the [chef solo](https://www.vagrantup.com/docs/provisioning/chef_solo.html) provisioner,
because it's way more portable than a bunch of `bash` scripts.

## Prerequisites

  * [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    * [rbenv](https://github.com/rbenv/rbenv) is recommended
  * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [Vagrant](https://www.vagrantup.com/downloads.html)
  * [Vagrant vbguest plugin](https://github.com/dotless-de/vagrant-vbguest) is recommended (although not required)

## Configuration files

### `dirs_mapping.json`

A mapping for mounting directories from the host machine to the guest machine.

The file is JSON formatted where the root object is an array. The array is expected
to contain maps with at least two keys:

  * `host` - the dir of the host, to mount.
  * `guest` - the path to which we want to mount the dir to.

> NOTE: the value of `guest` *must* be a full path in the guest machine, for example: `/home/vagrant/host_home`

#### Example

```javascript
[
  {
    "host" : "~/",
    "guest" : "/home/vagrant/host_home"
  }
]
```

## Usage

By using the provided `Makefile`;

```
$ make
```

This should be:

  * Installing the [librarian-chef](https://github.com/applicationsonline/librarian-chef) gem
  * Fetching all cookbooks by using `librarian-chef`

After running `make`, use `vagrant` as you'd normally use it;

```
$ vagrant up
```

The default box is a [_Debian 7 (wheezt)_](https://atlas.hashicorp.com/debian/boxes/wheezy64)
box, however one can change it by providing a box name by using the `VAGRANT_BOX` environment variable;

```
$ VAGRANT_BOX=debian/jessie64 vagrant up
```
