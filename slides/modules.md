 Ansible Modules?
=================

----

 ping_module
----------
```bash
# example for commandline
$ ansible localhost -m ping

localhost | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

----

 RTFM!
-----

> ping – Try to connect to host, verify a usable python and return pong on success
> 
> From [docs.ansible.com](https://docs.ansible.com/ansible/latest/modules/ping_module.html)

----

 copy_module
--------
### Examples
```
- name: Copy file with owner and permissions
  copy:
    src: files/foo.conf
    dest: /etc/foo.conf
    owner: foo
    group: foo
    mode: '0644'
```

----

 copy_module
--------
### ein paar mögliche Parameter...
|||
|-|-|
|``backup`` | Create a backup file including the timestamp information so you can get the original file back if you somehow clobbered it incorrectly.|
| ``validate`` | The validation command to run before copying into place.|

----

<script src="http://localhost:8000/14.js" id="asciicast-14" async data-autoplay="true" data-size="big"></script>
