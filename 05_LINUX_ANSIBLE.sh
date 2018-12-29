# remote_user and gater_facts usage
- hosts: ansible
  remote_user: root
  gather_facts: no
  roles:
  - url_check

  
# block usage
---
 - hosts: ansible
   remote_user: root
   gather_facts: no
   tasks:
   - name: Handle the error
     block:
       - debug:
           msg: "I execute normally"
       - name: i force a failure
         command: /bin/false
       - debug:
           msg: "I never execute, due to the above task failing, :-("
     rescue:
       - debug:
           msg: "I caught an error, can do stuff here to fix it, :-)"
     always:
      - debug:
          msg: "This always executes "
     

# template  models usage 
#tree
.
├── tasks
│   └── main.yml
├── templates
│   └── test.j2
└── vars
    └── main.yml
#tasks/main.yml 
- name: copy config to nodes
  template:
    src: test.j2
    dest: /tmp/test.conf
 #templates/test.j2
ExecStart=/usr/local/bin/etcd --name {{ master_hostname }} --initial-advertise-peer-urls http://{{ master_ip }}:2380
#vars/main.yml
master_ip: 192.168.101.14
master_hostname: master
node1_ip: 192.168.101.15
node1_hostname: node1


#models
- name: create dir /home/ts/dbUpdate/TS_{{version}}_db
  file:
      path: /home/ts/dbUpdate/TS_{{version}}_db
      state: directory

- name: Extract database update file to service
  copy:
      src: /root/ansible/TS_{{version}}_db.zip
      dest: /home/ts/dbUpdate/TS_{{version}}_db

- name: Extract database file
  shell: cd /home/ts/dbUpdate/TS_{{version}}_db && unzip -o  TS_{{version}}_db.zip        copy
  register: ora_error
  ignore_errors: True
  tags: 
      - rollback_check
- name: Check Httpd service, Port 80
  wait_for:
      host: 192.168.110.128 
      port: 80
      connect_timeout: 60
      delay: 10

- name: Check Httpd service, url
  uri: 
      url="http://192.168.110.128/"
  register: S_frontend_web_rc
  ignore_errors: yes

- fail: msg=" The system may not be "
  when: S_frontend_web_rc.failed == true

  
 

