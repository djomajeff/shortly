import "./App.css";
import { LinkContextProvider } from "./store/link-context";
import { QueryClientProvider } from "@tanstack/react-query";
import { queryClient } from "./utils/helper";
import { RouterProvider } from "react-router-dom";
import { router } from "./utils/router";

function App() {
  return (
    <LinkContextProvider>
      <QueryClientProvider client={queryClient}>
        <RouterProvider router={router} />
      </QueryClientProvider>
    </LinkContextProvider>
  );
}

export default App;
