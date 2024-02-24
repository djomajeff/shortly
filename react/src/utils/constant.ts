const LOCAL_KEY = "link-key";
const apiKey = import.meta.env.VITE_APIKEY;
const leadingNavItems = [
  {
    name: "Features",
    path: "/features",
  },
  {
    name: "Pricing",
    path: "/pricing",
  },
  {
    name: "Resources",
    path: "/resources",
  },
];

export { LOCAL_KEY, apiKey, leadingNavItems };
