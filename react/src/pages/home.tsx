import Overview from "../components/Overview/Overview";
import Statistics from "../components/StatsSection/Statistics";
import BoostLink from "../components/BoostLink";
import Footer from "../components/Footer/Footer";
import { useRef } from "react";

export const HomePage = () => {
  const ref = useRef<HTMLFormElement>(null);

  function handleAnimate() {
    ref.current!.scrollIntoView({ behavior: "smooth" });
  }

  return (
    <>
      <Overview onAnimateToForm={handleAnimate} />
      <Statistics ref={ref} />
      <BoostLink onAnimateToForm={handleAnimate} />
      <Footer />
    </>
  );
};
