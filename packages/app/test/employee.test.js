
import { getConnection, closeConnection } from './utils';

let db;

describe('employee', () => {
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
});
