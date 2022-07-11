# Postgis for app

A custom Postgis Docker image to create an unprivileged with its own schema dedicated to apps.

App user credentials (if no parameters where provided) can be found in `/var/lib/postgresql/data/app.pwd` file.

Custom settings are:

```
POSTGRES_APP_USER # Default is "app"
POSTGRES_APP_PASSWORD # Default is generated with pwgen cmd
```

## Equipe

- @lpofredc (@lpofredc - LPO Auvergne-Rhône-Alpes)

![logoLPO AuRA](https://raw.githubusercontent.com/lpoaura/biodivsport-widget/master/images/LPO_AuRA_l250px.png)
