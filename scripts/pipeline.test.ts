import { fail } from "assert";

import axios, { AxiosResponse } from "axios";


const APP_NAME =
  process.env.APP_NAME

const TEST_URL =
  process.env.TEST_URL

describe("Smoke Test", () => {
  describe(`Test case: ${APP_NAME} endpoints`, () => {
    if (APP_NAME.indexOf('plum') !== -1) {
      console.log("env is: " process.env.DNS_ENVIRONMENT)
      if (process.env.DNS_ENVIRONMENT == ""){
        test(`Skip plum tests in PROD`, async () => {
          expect(true).toBe(true)
        });
      }
    }
    test(`redirects http to https for ${APP_NAME}`, async () => {
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
    test(`app is healthy (${APP_NAME}/health)`, async () => {
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
    test(`expected content loads (${APP_NAME}/)`, async () => {
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
        expect(response.status).toBe(200);
      } catch(error) {
        fail(error.stack);
      }
    });
  });
});
