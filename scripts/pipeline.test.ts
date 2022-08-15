import { fail } from "assert";

import axios, { AxiosResponse } from "axios";

const TEST_URL =
  process.env.TEST_URL || "sandbox.platform.hmcts.net";

describe("Smoke Test", () => {
  describe("Test case: plum endpoints", () => {
    test("Test http redirect (plum)", async () => {
      try {
        const url = `http://${TEST_URL}`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              Accept: "application/json, text/plain, */*",
              "Accept-Encoding": "gzip",
            },
            maxRedirects: 0,
            validateStatus: false,
          })

        expect(response.status).toBe(301);
        expect(response.headers.location).toBe(
          `${TEST_URL}`
        );
      } catch(error) {
        fail(error.stack);
      }
    });
    test("Test http response (plum/health)", async () => {
      try {
        const url = `https://${TEST_URL}/health`;
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
    test("Test http response (plum/)", async () => {
      try {
        const url = `https://${TEST_URL}`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              "Accept-Encoding": "gzip",
            },
          })
        expect(response.data).toContain("There are no recipes");
      } catch(error) {
        fail(error.stack);
      }
    });
  });
});
