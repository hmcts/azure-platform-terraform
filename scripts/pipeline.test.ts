import { fail } from "assert";

import axios, { AxiosResponse } from "axios";

var e: object;

const GLOBAL_DOMAIN_NAME =
  process.env.GLOBAL_DOMAIN_NAME || "sandbox.platform.hmcts.net";

describe("Smoke Test", () => {
  describe("Test case: plum endpoints", () => {
    test("Test http redirect (plum)", async () => {
      try {
        const url = `http://plum.${GLOBAL_DOMAIN_NAME}/`;
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
          .catch(function (error) {
            e = error;
          });

        expect(response.status).toBe(301);
        expect(response.headers.location).toBe(
          `https://plum.${GLOBAL_DOMAIN_NAME}/`
        );
      } catch {
        fail(e.stack);
      }
    });
    test("Test http response (plum/health)", async () => {
      try {
        const url = `https://plum.${GLOBAL_DOMAIN_NAME}/health`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              Accept: "application/json, text/plain, */*",
              "Accept-Encoding": "gzip",
            },
          })
          .catch(function (error) {
            e = error;
          });

        expect(response.data.status).toBe("UP");
      } catch {
        fail(e.stack);
      }
    });
    test("Test http response (plum/)", async () => {
      try {
        const url = `https://plum.${GLOBAL_DOMAIN_NAME}/`;
        const response: AxiosResponse = await axios
          .request({
            method: "GET",
            url: url,
            headers: {
              "Accept-Encoding": "gzip",
            },
          })
          .catch(function (error) {
            e = error;
          });
        expect(response.data).toContain("There are no recipes");
      } catch {
        fail(e.stack);
      }
    });
  });
});
