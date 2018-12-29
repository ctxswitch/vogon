# Vogon (WIP)

Vogon is a chef cookbook and some helpers that I've created to help me maintain my personal and work laptops and workstations.  It's unapologetically a personal project - so don't expect a ton of customizations, but if you find something that you would like to add/support I'll gladly take pull requests.  Currently I'm starting out with only Debian/Ubuntu Linux support since I'm currently looking at running those distributions exclusively.  I'm a MacOS and Windows user as well at times so the possibility exists that I'll add support as needed. 

## Quickstart

From your laptop or workstation, you can bootstrap the environment by running the following command:

```
curl https://raw.githubusercontent.com/rlyon/vogon/master/bootstrap.sh | sudo bash
```

Once your system has been set up, create a client.json file that contains the attributes and roles.  In `~/chef/vogon/client.json` add something like this:

```
{
    "run_list": [
        "recipe[vogon::system]",
        "recipe[vogon::vscode]",
        "recipe[vogon::docker]",
        "recipe[vogon::devel]",
        "recipe[vogon::chrome]",
        "recipe[vogon::insync]"
    ]
}
```

You can then run `vogon check` to run chef-solo with the `--why-run` flag or `vogon apply` to apply your changes.