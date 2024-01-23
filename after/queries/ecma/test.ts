const test = `select * from table`;
await knex.raw(`SELECT * FROM table`);

const sql = SQL`select * from table`;
