import { FC } from "react";
import { illustrationWorkingImage } from "../../utils/images";
import classes from "./Overview.module.css";

const Overview: FC<{ onAnimateToForm: VoidFunction }> = (props) => {
  return (
    <section className={classes.overview}>
      <div className={classes.description}>
        <h1>More than just shorter links</h1>
        <p>
          Build your brand's recognition and get detailed insights on how your
          links are performing.
        </p>
        <button onClick={props.onAnimateToForm}>Get Started</button>
      </div>
      <img src={illustrationWorkingImage} alt="Working image" />
    </section>
  );
};

export default Overview;
