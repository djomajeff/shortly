import "./App.css";
import { LinkContextProvider } from "./store/link-context";
import { QueryClientProvider } from "@tanstack/react-query";
import { queryClient } from "./utils/helper";
import { HomePage } from "./pages/home";

function App() {
  return (
    <LinkContextProvider>
      <QueryClientProvider client={queryClient}>
        <HomePage />
      </QueryClientProvider>
    </LinkContextProvider>
  );
}

export default App;
