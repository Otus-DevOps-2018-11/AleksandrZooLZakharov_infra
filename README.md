# AleksandrZooLZakharov_infra
AleksandrZooLZakharov Infra repository

Выполнено шестое ДЗ (terraform-1) + задание с 1й звездой

Несколько ssh ключей (3шт) добавлено в такой конструкции:
resource "google_compute_project_metadata_item" "ssh_public_keys" {
  key = "ssh-keys"
  value = "${var.user}:${file("${var.user_public_key_path}")} ${var.user1}:${file("${var.user1_public_key_path}")} ${var.user2}:${file("${var.user2_public_key_path}")}"
}

При ручном добавлении ssh ключа appuser_web в метаданные проекта он уничтожается Терраформом после apply.

Из запрошенных описаний проблем: :) 
* с Трэвисом возникли недопонимания подстановки зачений из файла examples. Связаны со словом "можно" в задании. В задании звучит "(публичный ключ можно брать пользователя appuser)". Лучше изменить "можно" на "нужно" :)
* Разница в синтаксисе GCP и Terraform усложняет написание, хотя и мотивирует изучать оба набора документации, что со временем приводит к лучшему пониманию продукта.

