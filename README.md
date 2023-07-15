# LEMP Install

Этот скрипт предназначен для автоматической установки и настройки [LEMP](https://ru.wikipedia.org/wiki/LAMP) (Linux, Nginx, MySQL, PHP), phpMyAdmin и Composer. Он позволяет быстро подготовить среду разработки или развернуть проект на сервере без необходимости ручной установки и настройки каждого компонента отдельно.

## Использование

1. Убедитесь, что ваш сервер работает на операционной системе Ubuntu 22.04 и у вас установлен Git.
2. Склонируйте репозиторий с помощью команды:

    ```
    git clone https://github.com/Tiamenti/lemp-install.git
    ```

3. Перейдите в каталог скрипта:

    ```
    cd lemp-install
    ```

4. Откройте файл `settings.config` и настройте установщик:
    - `PHP_VERSION`: укажите версию PHP, которую вы хотите установить (по умолчанию 8.2).
    - `MYSQL_ROOT_PASSWORD`: укажите пароль для root пользователя MySQL (по умолчанию `password`). Если вы не хотите изменять/устанавливать пароль, удалите этот параметр **вместе с переносом строки**.
    - `INSTALL_PHPMYADMIN`: установите значение `false`, если вы не хотите устанавливать phpMyAdmin. Это так же отключит настройку nginx для него.
    - `INSTALL_COMPOSER`: установите `false`, если вы не хотите устанавливать composer. Это так же отключит его добавление в PATH.

    **При изменении файла, некоторые редакторы добавляют `\r` в конце строки (например VS Code), из за чего скрипт может работать некорректно. Желательно использовать [nano](https://www.nano-editor.org/) в качестве редактора.**

5. Если вы не отключали установку composer, то в файле `composer_packages.txt` вы можете указать пакеты, которые composer установит глобально. Название каждого пакета нужно указывать с новой строки. Если вы не хотите что бы composer устанавливал глобально какие-либо пакеты, просто удалите содержимое этого файла. *По умолчанию будет установлен [laravel/installer](https://github.com/laravel/installer)*.
6. Запустите скрипт с помощью команды:

    ```
    bash install.sh
    ```

### Установить только phpMyAdmin
Чтобы установить только phpMyAdmin и настроить для него nginx, выполните следующую команду:

```
bash ./scripts/install_phpmyadmin.sh
```

**При выполнении команды, не будет учитываться параметр `INSTALL_PHPMYADIN`**

### Установить только composer
Чтобы установить только composer и установить пакеты из файла `composer_packages.txt`, выполните следующую команду:

```
bash ./scripts/install_composer.sh
```

**При выполнении команды, не будет учитываться параметр `INSTALL_COMPOSER`**

## Важно
Обратите внимание, что при установке phpMyAdmin содержимое файла `/etc/nginx/sites-available/default` будет полностью заменено.