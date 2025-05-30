use postgres::{Client, NoTls, Row, Error};

pub struct Db {
    client: Client,
}

impl Db {
    /// Creates a new database connection
    pub fn connect() -> Result<Self, Error> {
        let client = Client::connect("host=localhost user=postgres dbname=wfrp", NoTls)?;
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
