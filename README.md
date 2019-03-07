# AleksandrZooLZakharov_infra
AleksandrZooLZakharov Infra repository


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
reddit-app = 10.132.0.7
testapp_IP = 34.76.13.151
testapp_port = 9292
