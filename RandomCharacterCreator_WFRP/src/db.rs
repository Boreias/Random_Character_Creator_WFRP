use postgres::{Client, NoTls, Row, Error};
use std::env;

pub struct Db {
    client: Client,
}

impl Db {
    /// Creates a new database connection
    pub fn connect() -> Result<Self, Error> {
        let host = env::var("DB_HOST").expect("DB_HOST não definido");
        let user = env::var("DB_USER").expect("DB_USER não definido");
        let dbname = env::var("DB_DBNAME").expect("DB_DBNAME não definido");

        let connection_string = format!("host={} user={} dbname={}", host, user, dbname);

        let client = Client::connect(&connection_string, NoTls)?;
        Ok(Db { client })
    }

    /// Executes a query that returns a single row
    pub fn query_one(&mut self, query: &str, params: &[&(dyn postgres::types::ToSql + Sync)]) -> Result<Row, Error> {
        self.client.query_one(query, params)
    }

    /// Executes a query that returns multiple rows
    pub fn query(&mut self, query: &str, params: &[&(dyn postgres::types::ToSql + Sync)]) -> Result<Vec<Row>, Error> {
        self.client.query(query, params)
    }
}
