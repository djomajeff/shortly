import { Outlet } from "react-router-dom";
import Navbar from "../components/Navigation/Navbar";

export default function RootLayout() {
  return (
    <>
      <Navbar />
      <main>
        <Outlet />
      </main>
    </>
  );
}
