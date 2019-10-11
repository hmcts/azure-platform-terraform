env = "ithc"
resource_group_name = "reformmgmtrg"

ithc-platform-hmcts-net = [
  {
    name = "@",
    records = [
      "ns1-01.azure-dns.com.",
      "ns2-01.azure-dns.net.",
      "ns3-01.azure-dns.org.",
      "ns4-01.azure-dns.info."
    ],
    ttl  = 172800,
    type = "NS"
  },
   {
    name =  "manage.appeal-benefit-decision",
    records =  ["hmcts-sscs-cor-frontend-ithc.trafficmanager.net"],
    ttl =  60,
    type = "CNAME"
  },
  {
    name =  "tmmanage.appeal-benefit-decision",
    records =  ["590582cd-441a-4601-9f6a-f8203d4c19fe.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
     {
    name =  "ccpay-bubble",
    records =  ["11d1facb-25d7-49ef-a8dc-d698479270a2.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
  {
    name = "ctscmail",
    "records": [
      "51.104.202.183"
    ],
    ttl = 3600,
    type = "A"
  },
    {
    name = "decree-absolute-aks",
    records = ["hmcts-ithc.azurefd.net"],
    ttl = 3600,
    type = "CNAME"
  },
  {
    name = "decree-nisi-aks",
    records = ["hmcts-ithc.azurefd.net"],
    ttl =  3600,
    type = "CNAME"
  },
  {
    name =  "gateway-ccd",
    records =  ["a56e4113-9db3-4bd3-ad20-01f2eb3926c4.cloudapp.net"],
    ttl = 60,
    type = "CNAME"
  },
  {
    name =  "idam-web-public",
    records =  ["f8ba11e0-da48-45a5-b105-7aed33e2bf42.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
  {
    name    = "contact.justice",
    records = [
      "10 ctscmail.ithc.platform.hmcts.net"
    ],
    ttl  = 3600,
    type = "MX"
  },
    {
    name =  "contact.justice",
    records =  [
        "v=spf1 ip4:51.145.107.152  ip4:51.145.123.93 -all"
    ],
    ttl =  3600,
    type = "TXT"
  },
  {
    name =  "_dmarc.contact.justice",
    records =  [
        "v=DMARC1; p=none"
    ],
    ttl =  3600,
    type = "TXT"
  },
  {
    name =  "moneyclaim-legal",
    records =  ["e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
  {
    name =  "moneyclaims",
    records =  ["e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
  {
    name =  "moneyclaims-legal",
    records =  ["e10387a8-f6ed-40f8-9557-f158497ccb5e.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  },
   {
    name = "paybubble",
    records = [
      "51.143.182.143"
    ],
    ttl = 60,
    type = "A"
  },
  {
    name =  "petitioner-frontend-aks",
    records =  ["hmcts-ithc.azurefd.net"],
    ttl =  3600,
    type = "CNAME"
  },
  {
    name =  "respond-divorce-aks",
    records =  ["hmcts-ithc.azurefd.net"],
    ttl =  3600,
    type = "CNAME"
  },
  {
    name =  "sscs-tribunals-frontend",
    records =  ["hmcts-sscs-tribunals-frontend-ithc.trafficmanager.net"],
    ttl =  300,
    type = "CNAME"
  },
  {
    name =  "tmsscs-tribunals-frontend",
    records =  ["590582cd-441a-4601-9f6a-f8203d4c19fe.cloudapp.net"],
    ttl =  300,
    type = "CNAME"
  },
  {
    name =  "www-ccd",
    records =  ["a56e4113-9db3-4bd3-ad20-01f2eb3926c4.cloudapp.net"],
    ttl =  60,
    type = "CNAME"
  }
]