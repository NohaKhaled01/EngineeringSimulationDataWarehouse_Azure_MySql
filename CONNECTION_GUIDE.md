# Connecting to the sim Database

This guide explains how to connect to the sim analytics database and query it.
It assumes you have been given a read-only login by the database administrator.

## What you need

Before connecting, obtain the following from the administrator:

- **Server address** (host) — e.g. `your-server.mysql.database.azure.com`
- **Your username** — your personal read-only login (e.g. `sim_reader`)
- **Your password**
- Confirmation that **your IP address has been added to the server firewall**

You do **not** get the admin credentials. Each user connects with their own
read-only account, which can query every table but cannot modify, insert, or
delete anything.

## A SQL client

You need a tool to run queries. Any MySQL client works; common choices:

- **MySQL Workbench** — official, free, good schema browser.
- **VS Code** with a MySQL extension.

## Connection settings

Create a new connection in your client with these values:

| Setting   | Value                                    |
|-----------|------------------------------------------|
| Host      | *(server address from the admin)*        |
| Port      | `3306`                                   |
| Username  | *(your username)*                        |
| Password  | *(your password)*                        |
| SSL       | **Required** — see note below            |

### SSL is required

The server enforces encrypted connections. In your client's SSL settings,
set SSL mode to **Require** (in MySQL Workbench: the connection's **SSL** tab →
**Use SSL: Require**). If you skip this, the connection is rejected with an
SSL-related error.

## If you cannot connect

The most common cause is the **firewall**. Home and office internet
connections often have IP addresses that change periodically, and the server
only accepts approved addresses. If a connection that worked before suddenly
fails with a timeout or "cannot connect" error:

1. Your IP address has most likely changed.
2. Contact the administrator to have your current IP re-added.

An **"access denied"** error (as opposed to a timeout) means the username or
password is wrong — that is a credentials issue, not a firewall one.

## What you can query

Once connected, you have read-only access. The data is organized in layers:

- **Marts** (`mart_*`, `aggmart_*`) — clean, ready-to-query tables that answer
  common questions directly. **Start here.** Most questions are a simple
  `SELECT ... WHERE ...` against a mart.
- **Staging** (`stg_*`) — cleaned versions of each source table, one per table.
  Use these for questions the marts don't cover.

See the `analyses/` folder in the project repository for example queries
against the marts.

## Example

```sql
-- Number of requests in a given stage
SELECT *
FROM aggmart_requests_in_stage
WHERE stage_title LIKE '%<your search term>%';
```

Replace the placeholder with your own value. Because the mart has already
done the joining and counting, questions like this are a single short query
rather than a multi-table join.
