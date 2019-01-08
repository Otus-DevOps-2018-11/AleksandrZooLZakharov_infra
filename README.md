# AleksandrZooLZakharov_infra
AleksandrZooLZakharov Infra repository

Найденный способ подключения к someinternalhost удовлетворил сразу основному и дополнительному заданию. 
Этот способ - создать и настроить файл config в папке .ssh, где указать алиасы обоих хостов и проброс ssh туннеля сразу к someinternalhost сквозь bastion, применяя локальный ключ ssh сессии, привязанный в gcp ко всем создаваемым там вирт.машинам.
Текст файла config в моём случае таков:

Host bastion
 User avzakharov
 Hostname 35.195.129.25
 IdentityFile ~/.ssh/avzakharov

Host someinternalhost
 User avzakharov
 Hostname 10.132.0.3
 ProxyCommand ssh bastion -W %h:%p
 IdentityFile ~/.ssh/avzakharov

bastion_IP = 35.195.129.25
someinternalhost_IP = 10.132.0.3

