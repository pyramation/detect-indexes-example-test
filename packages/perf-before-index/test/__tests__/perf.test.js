import { getConnection, closeConnection } from '../utils';
import { readFileSync } from 'fs';

let db;

describe('database', () => {
  beforeEach(async () => {
    db = await getConnection();
  });
  afterEach(async () => {
    await closeConnection(db);
  });
  describe('basic', () => {
    it('it works', async () => {
      const company = await db.one(
        `INSERT INTO app_public.company (name) VALUES ($1) RETURNING *`,
        ['Acme, co']
      );
      expect(company).toBeTruthy();
      const employee = await db.one(
        `INSERT INTO app_public.employee (name, company_id) VALUES ($1, $2) RETURNING *`,
        ['John Doe', company.id]
      );
      expect(employee).toBeTruthy();
    });
  });
  describe('performance', () => {
    it('updated query detects 3 missing indexes', async () => {
      const query = readFileSync(__dirname + '/queries/updated.sql').toString();
      const results = await db.any(query);
      expect(results.length).toBe(3);
    });
    it('simple query detects 3 missing indexes', async () => {
      const query = readFileSync(__dirname + '/queries/simple.sql').toString();
      const results = await db.any(query);
      expect(results.length).toBe(3);
    });
    it('original query detects 3 missing indexes', async () => {
      const query = readFileSync(
        __dirname + '/queries/original.sql'
      ).toString();
      const results = await db.any(query);
      expect(results.length).toBe(3);
    });
  });
});
