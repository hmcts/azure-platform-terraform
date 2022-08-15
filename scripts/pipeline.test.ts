import { fail } from "assert";

import axios, { AxiosResponse } from "axios";


const APP_NAME =
  process.env.APP_NAME

const DNS_ZONE =
  process.env.DNS_ZONE

const TEST_URL = `${APP_NAME}.${DNS_ZONE}`

describe("Smoke Test", () => {
  describe(`Test case: ${APP_NAME} endpoints`, () => {
    test(`Test http redirect (${APP_NAME})`, async () => {
      try {
        const url = `http://${TEST_URL}/`;
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
          `https://${TEST_URL}/`
        );
      } catch(error) {
        fail(error.stack);
      }
    });
    test(`Test http response (${APP_NAME}/health)`, async () => {
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
    test(`Test http response (${APP_NAME}/)`, async () => {
      try {
        const url = `https://${TEST_URL}/`;
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
