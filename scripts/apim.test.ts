import { fail } from "assert";

import axios, { AxiosResponse } from "axios";


const APP_NAME =
  process.env.APP_NAME

const TEST_URL =
  process.env.TEST_URL

describe("Smoke Test", () => {
  describe(`Test case: apim test`, () => {
    test(`expected content loads (${APP_NAME})`, async () => {
      try {
        const url = `https://${TEST_URL}/health/liveness`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              "Accept-Encoding": "gzip",
            },
          })
        expect(response.status).toBe(200);
      } catch(error) {
        fail(error.stack);
      }
    });
  });
});
