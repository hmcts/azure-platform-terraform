import { fail } from "assert";

import axios, { AxiosResponse } from "axios";

// APP_NAME will be set to the value of plum or toffee
const APP_NAME =
  process.env.APP_NAME


// TEST_URL will be set to ${product}.${environment}.platform.hmcts.net
const TEST_URL =
  process.env.TEST_URL

describe("Test Name", () => {
  describe(`Test case ${TEST_URL}`, () => {
    test(`Success message`, async () => {
      try {

        // Placeholder test to check TEST_URL is defined
        expect(TEST_URL).toBeDefined();

        // Example test: perform a GET request against your applications liveness endpoint
        // const url = `https://${TEST_URL}/health/liveness`;
        // const response: AxiosResponse = await axios
        //   .request({
        //     method: "GET",
        //     url: url,
        //     headers: {
        //       "Accept-Encoding": "gzip",
        //     },
        //   })
        // Example response: expect the HTTP status code 200
        // expect(response.status).toBe(200);
      } catch(error) {
        fail(error.stack);
      }
    });
  });
});
