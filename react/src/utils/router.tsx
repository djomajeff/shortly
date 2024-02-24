import { createBrowserRouter } from "react-router-dom";
import RootLayout from "../pages/Root";
import { HomePage } from "../pages/home";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <RootLayout />,
    children: [
      { index: true, element: <HomePage /> },
      { path: "features", element: <HomePage /> },
      { path: "pricing", element: <HomePage /> },
      { path: "resources", element: <HomePage /> },
    ],
  },
]);
