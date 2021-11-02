# ansible-apps_adminer

## Description

[![Galaxy Role](https://img.shields.io/badge/galaxy-apps_adminer-purple?style=flat)](https://galaxy.ansible.com/lotusnoir/apps_adminer)
[![Version](https://img.shields.io/github/release/lotusnoir/ansible-apps_adminer.svg)](https://github.com/lotusnoir/ansible-apps_adminer/releases/latest)
![GitHub repo size](https://img.shields.io/github/repo-size/lotusnoir/ansible-apps_adminer?color=orange&style=flat)
[![downloads](https://img.shields.io/ansible/role/d/52290)](https://galaxy.ansible.com/lotusnoir/apps_adminer)
![Ansible Quality Score](https://img.shields.io/ansible/quality/52290)
[![License](https://img.shields.io/badge/license-Apache--2.0-brightgreen?style=flat)](https://opensource.org/licenses/Apache-2.0)


Deploy [adminer](https://github.com/vrana/adminer) a simple web administration tool for database. 

## Requierements

You need to install and configure a web server like nginx / apache.

## Role variables

| Name                  | Default Value     | Description                 |
| --------------------- | ----------------- | ----------------------------|
| `adminer_version`     | 4.8.1             | adminer version             |
| `adminer_owner`       | www-data          | owner for adminer files     |
| `adminer_group`       | www-data          | group for adminer files     |
| `adminer_install_dir` | /var/www/adminer/ | install directory           |
| `adminer_theme`       | ''                | choose a different theme [here](https://www.adminer.org/en/#extras)     |

## Examples

	---
	- hosts: apps_adminer
	  become: true
	  become_method: sudo
	  gather_facts: true
	  roles:
	    - role: ansible-apps_adminer
	  environment: 
	    http_proxy: "{{ http_proxy }}"
	    https_proxy: "{{ https_proxy }}"
	    no_proxy: "{{ no_proxy }}"

## License

This project is licensed under Apache License. See [LICENSE](/LICENSE) for more details.
