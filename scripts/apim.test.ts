import { fail } from "assert";

import axios, { AxiosResponse } from "axios";

// APP_NAME will be set to the value of plum or toffee
const APP_NAME =
  process.env.APP_NAME


// TEST_URL will be set to ${product}.${environment}.platform.hmcts.net
const APIM_TEST_URL =
  process.env.APIM_TEST_URL

describe("Test Name", () => {
  describe(`Test case ${APIM_TEST_URL}`, () => {
    test(`apim is healthy (${APIM_TEST_URL}/health/liveness)`, async () => {
      try {
        const url = `https://${APIM_TEST_URL}/health/liveness`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              Accept: "application/json, text/plain, */*",
              "Accept-Encoding": "gzip",
            },
          })

        expect(response.data.status).toBe("UP");
      } catch(error) {
        fail(error.stack);
      }
    });
  });
});
