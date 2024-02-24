import { FC } from "react";
import classes from "./BoostLink.module.css";

const BoostLink: FC<{ onAnimateToForm: VoidFunction }> = (props) => {
  return (
    <section className={classes.boostLink}>
      <h2>Boost your links today</h2>
      <button onClick={props.onAnimateToForm}>Get Started</button>
    </section>
  );
};

export default BoostLink;
